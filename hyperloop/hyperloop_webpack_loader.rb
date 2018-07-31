require 'opal'
require 'browser'
require 'browser/delay'
require 'opal-autoloader'
require 'hyper-store'
require 'hyper-react'
# require 'react/auto-import'

require_tree 'stores'
require_tree 'components'
require_tree 'patches'

Hyperloop::TopLevel.on_ready_mount(App)
