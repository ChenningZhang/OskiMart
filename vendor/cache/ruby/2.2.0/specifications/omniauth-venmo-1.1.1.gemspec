# -*- encoding: utf-8 -*-
# stub: omniauth-venmo 1.1.1 ruby lib

Gem::Specification.new do |s|
  s.name = "omniauth-venmo"
  s.version = "1.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Tom Milewski"]
  s.date = "2014-06-13"
  s.description = "Venmo strategy for OmniAuth v1.2"
  s.email = ["tmilewski@gmail.com"]
  s.homepage = "https://github.com/tmilewski/omniauth-venmo"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.8"
  s.summary = "Venmo strategy for OmniAuth"

  s.installed_by_version = "2.4.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<omniauth>, ["~> 1.2"])
      s.add_runtime_dependency(%q<omniauth-oauth2>, ["~> 1.1"])
      s.add_development_dependency(%q<dotenv>, ["~> 0"])
      s.add_development_dependency(%q<sinatra>, ["~> 0"])
    else
      s.add_dependency(%q<omniauth>, ["~> 1.2"])
      s.add_dependency(%q<omniauth-oauth2>, ["~> 1.1"])
      s.add_dependency(%q<dotenv>, ["~> 0"])
      s.add_dependency(%q<sinatra>, ["~> 0"])
    end
  else
    s.add_dependency(%q<omniauth>, ["~> 1.2"])
    s.add_dependency(%q<omniauth-oauth2>, ["~> 1.1"])
    s.add_dependency(%q<dotenv>, ["~> 0"])
    s.add_dependency(%q<sinatra>, ["~> 0"])
  end
end
