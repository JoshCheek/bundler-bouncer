unless defined? Bundler
  require 'bundler/bouncer/messages'
  $stderr.puts Bundler::Bouncer::Messages[:message]
  exit 1
end
