class InvokedApp < Struct.new(:exitstatus, :stdout, :stderr)
  require 'open3'
  def self.invoke(command)
    Open3.popen3 command do |stdin, stdout, stderr, wait_thr|
      self.new(wait_thr.value.exitstatus, stdout.read, stderr.read)
    end
  end
end

def run_app(dir, options)
  Dir.chdir "#{File.dirname __FILE__}/mock_projects/#{dir}" do
    command = ''
    command << 'bundle exec ' if options[:bundler]
    command << "ruby app.rb"
    InvokedApp.invoke command
  end
end

