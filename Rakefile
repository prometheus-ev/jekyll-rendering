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
      :license      => %q{AGPL},
      :homepage     => :"prometheus-ev",
      :dependencies => %w[]
    }
  }}
rescue LoadError => err
  warn "Please install the `hen' gem. (#{err})"
end

begin
  require 'jekyll/testtasks/rake'
rescue LoadError => err
  warn "Please install the `jekyll-testtasks' gem. (#{err})"
end
