# Hyperstack.configuration do |config|
#   # helper = Webpacker::Helper
#   # config.transport = :action_cable
#   # config.import 'reactrb/auto-import'
#   config.import 'opal_hot_reloader'
#   config.cancel_import 'react/react-source-browser' # bring your own React and ReactRouter via Yarn/Webpacker
#   #config.console_auto_start = false
#   # config.import 'react/ext/opal-jquery/element', client_only: true
# end

Hyperstack.configuration do |config|
  config.prerendering = :off
  config.import 'hyperstack/hotloader', client_only: true if Rails.env.development?
  config.hotloader_port = 25223
end
