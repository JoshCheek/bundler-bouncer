module Bundler
  module Bouncer
    Messages = {
      :missing_bundler  => "\e[31mTry running this app again with `bundle exec`\e[0m",
      :turned_off       => "\e[33mWarning: Bundler is not running.\e[0m",
    }
  end
end
