# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "jekyll-rendering"
  s.version = "0.0.9"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jens Wille"]
  s.date = "2013-07-15"
  s.description = "Jekyll plugin to provide alternative rendering engines."
  s.email = "jens.wille@gmail.com"
  s.extra_rdoc_files = ["README", "COPYING", "ChangeLog"]
  s.files = ["lib/jekyll/rendering.rb", "lib/jekyll/rendering/version.rb", "COPYING", "ChangeLog", "README", "Rakefile"]
  s.homepage = "http://github.com/prometheus-ev/jekyll-rendering"
  s.licenses = ["AGPL"]
  s.rdoc_options = ["--charset", "UTF-8", "--line-numbers", "--all", "--title", "jekyll-rendering Application documentation (v0.0.9)", "--main", "README"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.5"
  s.summary = "Jekyll plugin to provide alternative rendering engines."
end
