class HyperComponent
  include Hyperstack::Component
  include Hyperstack::Router::Helpers
  include Hyperstack::Legacy::Store

  param_accessor_style :legacy
end
