# -*- encoding: utf-8 -*-
# stub: native-package-installer 1.0.7 ruby lib

Gem::Specification.new do |s|
  s.name = "native-package-installer".freeze
  s.version = "1.0.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Kouhei Sutou".freeze]
  s.date = "2019-03-09"
  s.description = "Users need to install native packages to install an extension library\nthat depends on native packages. It bores users because users need to\ninstall native packages and an extension library separately.\n\nnative-package-installer helps to install native packages on \"gem install\".\nUsers can install both native packages and an extension library by one action,\n\"gem install\".".freeze
  s.email = ["kou@clear-code.com".freeze]
  s.homepage = "https://github.com/ruby-gnome2/native-package-installer".freeze
  s.licenses = ["LGPL-3+".freeze]
  s.rubygems_version = "2.7.6".freeze
  s.summary = "native-package-installer helps to install native packages on \"gem install\"".freeze

  s.installed_by_version = "2.7.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<test-unit-rr>.freeze, [">= 0"])
    else
      s.add_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<test-unit-rr>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<test-unit-rr>.freeze, [">= 0"])
  end
end
