# -*- encoding: utf-8 -*-
# stub: cairo 1.16.4 ruby lib
# stub: ext/cairo/extconf.rb

Gem::Specification.new do |s|
  s.name = "cairo".freeze
  s.version = "1.16.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "msys2_mingw_dependencies" => "cairo" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Kouhei Sutou".freeze]
  s.date = "2019-03-09"
  s.description = "Ruby bindings for cairo".freeze
  s.email = ["kou@cozmixng.org".freeze]
  s.extensions = ["ext/cairo/extconf.rb".freeze]
  s.extra_rdoc_files = ["README.rdoc".freeze]
  s.files = ["README.rdoc".freeze, "ext/cairo/extconf.rb".freeze]
  s.homepage = "https://rcairo.github.io/".freeze
  s.licenses = ["Ruby".freeze]
  s.rubygems_version = "2.7.6".freeze
  s.summary = "Ruby bindings for cairo".freeze

  s.installed_by_version = "2.7.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<pkg-config>.freeze, [">= 1.2.2"])
      s.add_runtime_dependency(%q<native-package-installer>.freeze, [">= 1.0.3"])
      s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_development_dependency(%q<test-unit>.freeze, [">= 0"])
      s.add_development_dependency(%q<packnga>.freeze, [">= 0"])
      s.add_development_dependency(%q<poppler>.freeze, [">= 3.1.1"])
    else
      s.add_dependency(%q<pkg-config>.freeze, [">= 1.2.2"])
      s.add_dependency(%q<native-package-installer>.freeze, [">= 1.0.3"])
      s.add_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_dependency(%q<test-unit>.freeze, [">= 0"])
      s.add_dependency(%q<packnga>.freeze, [">= 0"])
      s.add_dependency(%q<poppler>.freeze, [">= 3.1.1"])
    end
  else
    s.add_dependency(%q<pkg-config>.freeze, [">= 1.2.2"])
    s.add_dependency(%q<native-package-installer>.freeze, [">= 1.0.3"])
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<test-unit>.freeze, [">= 0"])
    s.add_dependency(%q<packnga>.freeze, [">= 0"])
    s.add_dependency(%q<poppler>.freeze, [">= 3.1.1"])
  end
end
