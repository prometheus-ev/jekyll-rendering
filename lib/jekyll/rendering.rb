#--
###############################################################################
#                                                                             #
# jekyll-rendering -- Jekyll plugin to provide alternative rendering engines  #
#                                                                             #
# Copyright (C) 2010 University of Cologne,                                   #
#                    Albertus-Magnus-Platz,                                   #
#                    50923 Cologne, Germany                                   #
#                                                                             #
# Authors:                                                                    #
#     Jens Wille <jens.wille@uni-koeln.de>                                    #
#                                                                             #
# jekyll-rendering is free software; you can redistribute it and/or modify it #
# under the terms of the GNU General Public License as published by the Free  #
# Software Foundation; either version 3 of the License, or (at your option)   #
# any later version.                                                          #
#                                                                             #
# jekyll-rendering is distributed in the hope that it will be useful, but     #
# WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY  #
# or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for #
# more details.                                                               #
#                                                                             #
# You should have received a copy of the GNU General Public License along     #
# with jekyll-rendering. If not, see <http://www.gnu.org/licenses/>.          #
#                                                                             #
###############################################################################
#++

require 'erb'
require 'ostruct'

module Jekyll

  module Rendering
  end

  module Convertible

    alias_method :_rendering_original_do_layout, :do_layout

    # Overwrites the original method to use the configured rendering engine.
    def do_layout(payload, layouts)
      info = { :filters => [Jekyll::Filters], :registers => { :site => site } }

      payload['pygments_prefix'] = converter.pygments_prefix
      payload['pygments_suffix'] = converter.pygments_suffix

      # render and transform content (this becomes the final content of the object)
      self.content = engine.render(payload, content, info)
      transform

      # output keeps track of what will finally be written
      self.output = content

      # recursively render layouts
      layout = self

      while layout = layouts[layout.data['layout']]
        payload = payload.deep_merge('content' => output, 'page' => layout.data)
        self.output = engine.render(payload, output, info, layout.content)
      end
    end

    # call-seq:
    #   engine => aClass
    #
    # Returns the Engine class according to the configuration setting for
    # +engine+ (see subclasses of Engine::Base). Defaults to Engine::Liquid.
    def engine
      @engine ||= Engine[site.config['engine'] ||= 'liquid']
    end

  end

  module Engine

    # call-seq:
    #   Engine[engine] => aClass
    #
    # Returns the subclass whose name corresponds to +engine+.
    def self.[](engine)
      const_get(engine.capitalize)
    end

    class Base

      # call-seq:
      #   Engine::Base.render(*args)
      #
      # Renders the output. Defers to engine's render method.
      def self.render(payload, content, info, layout = nil)
        new(payload, content, info).render(layout || content)
      end

      attr_reader   :payload, :info
      attr_accessor :content

      def initialize(payload, content = nil, info = {})
        @payload, @content, @info = payload, content, info
      end

      # call-seq:
      #   render
      #
      # Renders the output. Must be implemented by subclass.
      def render
        raise NotImplementedError
      end

    end

    class Liquid < Base

      # call-seq:
      #   engine.render
      #   engine.render(content)
      #
      # Renders the +content+ using ::Liquid::Template::parse and then
      # calling ::Liquid::Template#render with +payload+ and +info+.
      def render(content = content)
        ::Liquid::Template.parse(content).render(payload, info)
      end

    end

    class Erb < Base

      attr_reader :site, :page

      def initialize(*args)
        super

        [Helpers, *info[:filters]].each { |mod| extend mod }

        %w[site page paginator].each { |key|
          value = payload[key] or next
          instance_variable_set("@#{key}", OpenStruct.new(value))
        }
      end

      # call-seq:
      #   engine.render => aString
      #   engine.render(content) => aString
      #   engine.render(content, binding) => aString
      #
      # Renders the +content+ as ERB template. Uses optional +binding+
      # if provided.
      def render(content = content, binding = binding)
        ::ERB.new(content).result(binding)
      end

      module Helpers

        # call-seq:
        #   include_file file => aString
        #   include_file file, binding => aString
        #
        # Includes file +file+ from <tt>_includes</tt> directory rendered
        # as ERB template. Uses optional +binding+ if provided.
        def include_file(file, binding = binding)
          Dir.chdir(File.join(site.source, '_includes')) {
            @choices ||= Dir['**/*'].reject { |x| File.symlink?(x) }

            if @choices.include?(file = file.strip)
              render(File.read(file), binding)
            else
              "Included file '#{file}' not found in _includes directory"
            end
          }
        end

        # call-seq:
        #   highlight text => aString
        #   highlight text, lang => aString
        #
        # Highlights +text+ according to +lang+ (defaults to Ruby).
        def highlight(text, lang = :ruby)
          if site.pygments
            render_pygments(text, lang)
          else
            render_codehighlighter(text, lang)
          end
        end

        protected

        def render_pygments(text, lang)
          output = add_code_tags(Albino.new(text, lang).to_s, lang)
          "#{payload['pygments_prefix']}#{output}#{payload['pygments_suffix']}"
        end

        def render_codehighlighter(text, lang)
          #The div is required because RDiscount blows ass
          <<-HTML
  <div>
    <pre>
      <code class="#{lang}">#{h(text).strip}</code>
    </pre>
  </div>
          HTML
        end

        def add_code_tags(code, lang)
          # Add nested <code> tags to code blocks
          code.sub(%r{<pre>},  %Q{<pre><code class="#{lang}">}).
               sub(%r{</pre>}, %q{</code></pre>})
        end

      end

    end

  end

  # Provide an engine-agnostic name for the hash representation.
  [Post, Page, Pager].each { |klass|
    klass.send(:alias_method, :to_hash, :to_liquid)
  }

end
