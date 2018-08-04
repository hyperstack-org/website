require_tree './components'
require_tree './stores'
require_tree './operations'



# following only required for development (find a way to build without for production)
require 'opal_hot_reloader'
OpalHotReloader.listen(25222, false, 1)
# require 'opal'

Document.ready? do
  Element['#hyperloopsite'].render{ AppRouter() }
end
