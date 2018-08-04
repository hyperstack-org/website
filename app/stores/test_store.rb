class TestStore < Hyperloop::Store

  receives Hyperloop::Application::Boot do
    init
  end

  class << self
    
    state :rubyglobalIndex, reader: true

    def init
      mutate.rubyglobalIndex "test_init"
    end

  end

end