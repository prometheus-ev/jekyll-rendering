# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{jekyll-rendering}
  s.version = "0.0.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jens Wille"]
  s.date = %q{2011-03-31}
  s.description = %q{Jekyll plugin to provide alternative rendering engines.}
  s.email = %q{jens.wille@uni-koeln.de}
  s.extra_rdoc_files = ["README", "COPYING", "ChangeLog"]
  s.files = ["lib/jekyll/rendering.rb", "lib/jekyll/rendering/version.rb", "README", "ChangeLog", "Rakefile", "COPYING"]
  s.rdoc_options = ["--charset", "UTF-8", "--title", "jekyll-rendering Application documentation (v0.0.7)", "--main", "README", "--line-numbers", "--all"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{Jekyll plugin to provide alternative rendering engines.}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
