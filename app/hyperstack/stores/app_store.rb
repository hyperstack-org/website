class AppStore < HyperStore

  # we would normally use this to init the store, but we need control over when it is initialized
  # receives Hyperloop::Application::Boot do
  #   boot
  # end

  class << self

    def section_stores
      @section_stores
    end

    def loading_error!
      @loading_error = true
    end

    def errors?
      @loading_error
    end

    def version
      @version
    end

    def history
      @history
    end

    def local_docs?
      @local_docs
    end

    def loaded?
      return false unless are_all_stores_loaded?
      true
    end

    private

    def boot version, local_docs, history
      @version = version
      @section_stores = {}
      @loading_error = false
      @local_docs = local_docs
      @history = history
      observe @stores_all_loaded = false

      extend EdgeDocs if @version == 'edge'

      load_all_docs
    end

    def are_all_stores_loaded?
      @section_stores.each do |section_hash|
        return false unless section_hash[1].loaded?
      end
      mutate @stores_all_loaded = true
      true
    end
  end

end
