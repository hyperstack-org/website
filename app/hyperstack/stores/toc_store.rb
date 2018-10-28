class TocStore < HyperStore
  class << self

    def visible_id=(id)
      mutate.visible_id id
    end

    def visible_id
      state.visible_id
    end
  end
end
