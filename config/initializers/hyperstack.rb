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
  config.import 'jquery', client_only: true
  config.import 'hyperstack/component/jquery', client_only: true
  config.import 'browser'
  config.import 'active_support'

  if Rails.env.development?
    config.import 'hyperstack/hotloader', client_only: true
    config.hotloader_port = 25222
  end
end
