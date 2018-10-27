# class HyperComponent
#   include Hyperstack::Component
# end


class TestMe
  include Hyperstack::Component
  render do
    H1 { "paradox" }
  end
end
