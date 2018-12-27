class HyperComponent
  include Hyperstack::Component
  include Hyperstack::Router::Helpers
  include Hyperstack::State::Observable

  param_accessor_style :hyperstack
end
