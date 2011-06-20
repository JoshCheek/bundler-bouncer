# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{bundler-bouncer}
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Joshua Cheek}]
  s.date = %q{2011-06-20}
  s.description = %q{Should your app run in the Bundler sandbox? Well then make sure it is, let bundler-bouncer kick you out of your app if you forgot to `bundle exec` it. Prevents absurdly difficult to find bugs, prevents you from propagating your system with bad data, eases the mind.}
  s.email = %q{josh.cheek@gmail.com}
  s.files = [%q{MIT-LICENSE.txt}, %q{Rakefile}, %q{Readme.md}, %q{spec/bundler-bouncer_spec.rb}, %q{spec/mock_projects}, %q{spec/mock_projects/with_bundler}, %q{spec/mock_projects/with_bundler/app.rb}, %q{spec/mock_projects/with_bundler/Gemfile}, %q{spec/mock_projects/with_bundler/Gemfile.lock}, %q{spec/mock_projects/without_bundler}, %q{spec/mock_projects/without_bundler/app.rb}, %q{spec/spec_helper.rb}, %q{lib/bundler}, %q{lib/bundler/bouncer}, %q{lib/bundler/bouncer/messages.rb}, %q{lib/bundler/bouncer.rb}]
  s.homepage = %q{https://github.com/JoshCheek/bundler-bouncer}
  s.require_paths = [%q{lib}]
  s.rubygems_version = %q{1.8.5}
  s.summary = %q{Exits app if you forgot to run under bundle exec.}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, ["~> 2.6.0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.15"])
    else
      s.add_dependency(%q<rspec>, ["~> 2.6.0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.15"])
    end
  else
    s.add_dependency(%q<rspec>, ["~> 2.6.0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.15"])
  end
end
