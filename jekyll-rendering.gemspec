# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "jekyll-rendering"
  s.version = "0.0.9"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jens Wille"]
  s.date = "2012-05-24"
  s.description = "Jekyll plugin to provide alternative rendering engines."
  s.email = "jens.wille@uni-koeln.de"
  s.extra_rdoc_files = ["README", "COPYING", "ChangeLog"]
  s.files = ["lib/jekyll/rendering/version.rb", "lib/jekyll/rendering.rb", "COPYING", "ChangeLog", "Rakefile", "README"]
  s.rdoc_options = ["--charset", "UTF-8", "--line-numbers", "--all", "--title", "jekyll-rendering Application documentation (v0.0.9)", "--main", "README"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "Jekyll plugin to provide alternative rendering engines."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
