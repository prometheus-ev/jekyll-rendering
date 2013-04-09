require File.expand_path(%q{../lib/jekyll/rendering/version}, __FILE__)

begin
  require 'hen'

  Hen.lay! {{
    :gem => {
      :name         => %q{jekyll-rendering},
      :version      => Jekyll::Rendering::VERSION,
      :summary      => %q{Jekyll plugin to provide alternative rendering engines.},
      :author       => %q{Jens Wille},
      :email        => %q{jens.wille@gmail.com},
      :homepage     => :blackwinter,
      :dependencies => %w[]
    }
  }}
rescue LoadError => err
  warn "Please install the `hen' gem. (#{err})"
end

begin
  require 'jekyll/testtasks/rake'
rescue LoadError
  warn "Please install the `jekyll-testtasks' gem."
end
