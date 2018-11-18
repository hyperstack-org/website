class TocFilterStore < HyperStore

  receives Hyperstack::Application::Boot do
    init
  end

  class << self

    state_reader :filter
    state_reader :show_filter_list

    def init
      @filter = ''
      @show_filter_list = false
    end

    def filter=(f)
      mutate @filter = f
      mutate @show_filter_list = (@filter == '' ? false : true)
    end
  end
end
