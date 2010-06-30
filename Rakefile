require %q{lib/jekyll/rendering/version}

begin
  require 'hen'

  Hen.lay! {{
    :gem => {
      :name         => %q{jekyll-rendering},
      :version      => Jekyll::Rendering::VERSION,
      :summary      => %q{Jekyll plugin to provide alternative rendering engines.},
      :files        => FileList['lib/**/*.rb'].to_a,
      :extra_files  => FileList['[A-Z]*'].to_a,
      :dependencies => %w[]
    }
  }}
rescue LoadError
  abort "Please install the 'hen' gem first."
end

### Place your custom Rake tasks here.
