unless defined? Bundler
  require 'bundler/bouncer/messages'
  if 'no' == ENV['USE_BUNDLER']
    $stderr.puts Bundler::Bouncer::Messages[:turned_off]
  else
    $stderr.puts Bundler::Bouncer::Messages[:missing_bundler]
    exit 1
  end
end
