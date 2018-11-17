class TocFilterStore < HyperStore

  receives Hyperstack::Application::Boot do
    init
  end

  class << self

    def init
      @filter = ''
      @show_filter_list = false
    end

    def filter=(f)
      mutate @filter = f
      if @filter == ''
        mutate @show_filter_list = false
      else
        mutate @show_filter_list = true
      end
    end

    def filter
      @filter
    end

    def show_filter_list
      @show_filter_list
    end
  end
end
