RSpec::Matchers.define :be_coloured do |colour|

  string = nil  
  colours = {
    :red    => "\e[31m",
    :yellow => "\e[33m",
    :none   => "\e[0m",
  }
  
  match do |_string|
    string = _string
    string.end_with?(colours[:none]) && string.start_with?(colours[colour])
  end  
  
  failure_message_for_should do
    "expected #{string.inspect} to be red (begin with #{colours[colour].inspect}, end with #{colours[:none].inspect})"
  end
    
  description do
    "be #{colour}"
  end

end



def rootdir
  File.expand_path(File.join(File.dirname(__FILE__), '..'))
end


def bouncer_message(message)
  require "bundler/bouncer/messages"
  Bundler::Bouncer::Messages[message]
end


def use_bundler_env(val='force', &block)
  crnt_val = ENV['USE_BUNDLER']
  ENV['USE_BUNDLER'] = val
  block.call
ensure
  ENV['USE_BUNDLER'] = crnt_val
end


def app_command(options)
  command = ''
  command << 'bundle exec '         if options[:bundler]
  command << 'ruby '
  command << "-I #{rootdir}/lib "   unless options[:bundler] 
  command << 'app.rb'
end


class InvokedApp < Struct.new(:exitstatus, :stdout, :stderr)
  require 'open3'
  def self.invoke(command)
    Open3.popen3 command do |stdin, stdout, stderr, wait_thr|
      self.new(wait_thr.value.exitstatus, stdout.read.strip, stderr.read.strip)
    end
  end
end


def run_app(dir, options)
  Dir.chdir "#{File.dirname __FILE__}/mock_projects/#{dir}" do
    use_bundler_env options[:USE_BUNDLER] do
      InvokedApp.invoke app_command(options)
    end
  end
end


def initialize_mock_projects
  return if @mock_projects_initialized
  @mock_projects_initialized = true
  
  require 'fileutils'
  
  # build the gem
  results = `rake gemspec`
  raise "Could not build gemspec: #{results}" unless $?.exitstatus.zero?
  
  # make the Gemfile
  File.open "#{rootdir}/spec/mock_projects/with_bundler/Gemfile", 'w' do |file|
    file.puts %Q[gem "bundler-bouncer", :path => "#{rootdir}"]
  end
  
  # install the gems
  Dir.chdir "#{rootdir}/spec/mock_projects/with_bundler" do
    result = `bundle install`
    raise "Could not install bundle: #{result}" unless $?.exitstatus.zero?
  end
end

initialize_mock_projects
