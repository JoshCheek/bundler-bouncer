require "rubygems"
require "rubygems/package_task"


task :default => :spec

require "rspec"
task :spec do
  sh 'rspec --format documentation --colour spec/*_spec.rb'
end


# This builds the actual gem. For details of what all these options
# mean, and other ones you can add, check the documentation here:
#
#   http://rubygems.org/read/chapter/20
#
spec = Gem::Specification.new do |s|
  s.name              = "bundler-bouncer"
  s.version           = "0.1.0"
  s.summary           = "Exits app if you forgot to run under bundle exec"
  s.author            = "Joshua Cheek"
  s.email             = "josh.cheek@gmail.com"
  s.homepage          = "https://github.com/JoshCheek/bundler-bouncer"
  s.has_rdoc          = false
  s.files             = %w(MIT-LICENSE.txt Rakefile Readme.md) + Dir.glob("{spec,lib}/**/*")
  s.require_paths     = ["lib"]
  s.add_development_dependency "rspec", "~> 2.6.0"
  s.add_development_dependency "bundler", "~> 1.0.15"
end

# This task actually builds the gem. We also regenerate a static
# .gemspec file, which is useful if something (i.e. GitHub) will
# be automatically building a gem for this project. If you're not
# using GitHub, edit as appropriate.
#
# To publish your gem online, install the 'gemcutter' gem; Read more 
# about that here: http://gemcutter.org/pages/gem_docs
Gem::PackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

desc "Build the gemspec file #{spec.name}.gemspec"
task :gemspec do
  File.open "#{spec.name}.gemspec", "w" do |f| 
    f << spec.to_ruby
  end
end

# If you don't want to generate the .gemspec file, just remove this line. Reasons
# why you might want to generate a gemspec:
#  - using bundler with a git source
#  - building the gem without rake (i.e. gem build blah.gemspec)
#  - maybe others?
task :package => :gemspec


