Hyperstack.configuration do |config|
  config.prerendering = :off

  config.import 'jquery', client_only: true
  config.import 'hyperstack/component/jquery', client_only: true
  config.import 'browser'
  config.import 'active_support'

  config.cancel_import 'react/react-source-browser'
  config.cancel_import 'hyperstack/router/react-router-source'

  if Rails.env.development?
    config.import 'hyperstack/hotloader', client_only: true
    config.hotloader_port = 25222
  end
end
