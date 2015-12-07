# -*- encoding: utf-8 -*-
# stub: gravatar_image_tag 1.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "gravatar_image_tag"
  s.version = "1.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Michael Deering"]
  s.date = "2013-11-11"
  s.email = "mdeering@mdeering.com"
  s.extra_rdoc_files = ["README.textile"]
  s.files = ["README.textile"]
  s.homepage = "http://github.com/mdeering/gravatar_image_tag"
  s.rubygems_version = "2.4.8"
  s.summary = "A configurable and documented Rails view helper for adding gravatars into your Rails application."

  s.installed_by_version = "2.4.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<activesupport>, ["~> 3.2.0"])
      s.add_development_dependency(%q<actionpack>, ["~> 3.2.0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<guard>, [">= 0"])
      s.add_development_dependency(%q<guard-rspec>, [">= 0"])
      s.add_development_dependency(%q<rb-fsevent>, ["~> 0.9"])
      s.add_development_dependency(%q<jeweler>, [">= 0"])
    else
      s.add_dependency(%q<activesupport>, ["~> 3.2.0"])
      s.add_dependency(%q<actionpack>, ["~> 3.2.0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<guard>, [">= 0"])
      s.add_dependency(%q<guard-rspec>, [">= 0"])
      s.add_dependency(%q<rb-fsevent>, ["~> 0.9"])
      s.add_dependency(%q<jeweler>, [">= 0"])
    end
  else
    s.add_dependency(%q<activesupport>, ["~> 3.2.0"])
    s.add_dependency(%q<actionpack>, ["~> 3.2.0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<guard>, [">= 0"])
    s.add_dependency(%q<guard-rspec>, [">= 0"])
    s.add_dependency(%q<rb-fsevent>, ["~> 0.9"])
    s.add_dependency(%q<jeweler>, [">= 0"])
  end
end
