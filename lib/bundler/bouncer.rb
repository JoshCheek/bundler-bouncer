unless defined? Bundler
  require 'bundler/bouncer/messages'
  $stderr.puts Bundler::Bouncer::Messages[:missing_bundler]
  exit 1
end
