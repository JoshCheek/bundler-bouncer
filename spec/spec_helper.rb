require 'open3'

InvokedApp = Struct.new :exitstatus, :stdout, :stderr

def run_app(dir, options)
  Dir.chdir "#{File.dirname __FILE__}/mock_projects/#{dir}" do
    
    # build up the command
    command = ''
    command << 'bundle exec ' if options[:bundler]
    command << "ruby app.rb"
    
    # invoke, and capture results
    invoked_app = InvokedApp.new
    Open3.popen3 command do |stdin, stdout, stderr, wait_thr|
      invoked_app.stdout      = stdout.read
      invoked_app.stderr      = stderr.read
      invoked_app.exitstatus  = wait_thr.value.exitstatus
    end
    invoked_app
  end
end

