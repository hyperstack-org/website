class SiteStore < Hyperloop::Store

  receives Hyperloop::Application::Boot do
    init
  end

  class << self

    def sections
      @section_stores
    end

    def loaded?
      ret = true
      @section_stores.each do |section|
        ret = false unless section[1].loaded?
      end
      ret
    end

    private

    def init
      @section_stores = {}
      load_start_section
      load_installation_section
      load_docs_section
      # load_gems_section
      load_tools_section
      # load_tutorials_section
    end

    def load_start_section
      section_name = "start"
      display_name = "Getting Started"

      pages = [
        { id: 0, name: 'components', repo: 'hyperstack-website',     file: 'app/markdown/start/components.md',  allow_edit: true },
        { id: 1, name: 'stores', repo: 'hyperstack-website',     file: 'app/markdown/start/stores.md',  allow_edit: true },
        { id: 2, name: 'models', repo: 'hyperstack-website',     file: 'app/markdown/start/models.md',  allow_edit: true },
        { id: 3, name: 'operations', repo: 'hyperstack-website',     file: 'app/markdown/start/operations.md',  allow_edit: true },
        { id: 4, name: 'policies', repo: 'hyperstack-website',     file: 'app/markdown/start/policies.md',  allow_edit: true },
        { id: 5, name: 'pradgmatic', repo: 'hyperstack-website',     file: 'app/markdown/start/pradgmatic.md',  allow_edit: true }
      ]
      @section_stores[section_name] = SectionStore.new(pages, section_name, display_name)
    end

    def load_docs_section
      section_name = "docs"
      display_name = "Hyperstack DSL Docs"

      pages = [
        { id: 0, name: 'components', repo: 'hyperstack-client',     file: 'hyper-component.md',  allow_edit: true },
        { id: 1, name: 'stores', repo: 'hyperstack-client',     file: 'hyper-store.md',  allow_edit: true },
        { id: 2, name: 'models', repo: 'hyperstack-client',      file: 'hyper-model.md',  allow_edit: true },
        { id: 3, name: 'router', repo: 'hyperstack-client',    file: 'hyper-router.md',  allow_edit: true },
        { id: 4, name: 'operations', repo: 'hyperstack-client', file: 'hyper-operation.md',  allow_edit: true },
        # { id: 5, name: 'policies', repo: 'hyper-operation', file: 'DOCS-POLICIES.md',  allow_edit: true },
        # { id: 6, name: 'dummy', repo: 'hyperstack-website', file: 'dist/dummy_DOCS.md',  allow_edit: true }
      ]
      @section_stores[section_name] = SectionStore.new(pages, section_name, display_name)
    end

    def load_installation_section
      section_name = "installation"
      display_name = "Installation & Setup"

      pages = [
        { id: 0, name: 'installation', repo: 'hyperstack-website', file: 'app/markdown/installation/overview.md',  allow_edit: true }
      ]
      @section_stores[section_name] = SectionStore.new(pages, section_name, display_name)
    end

    # def load_gems_section
    #   section_name = "gems"
    #
    #   pages = [
    #     { id: 0, name: 'gems', repo: 'hyperstack-website', file: 'app/markdown/gems/gems.md',  allow_edit: true }
    #   ]
    #   @section_stores[section_name] = SectionStore.new(pages, section_name)
    # end

    def load_tools_section
      section_name = "tools"
      display_name = "Tools"

      pages = [
        { id: 0, name: 'tools', repo: 'hyperstack-website', file: 'app/markdown/tools/tools.md',  allow_edit: true }
      ]
      @section_stores[section_name] = SectionStore.new(pages, section_name, display_name)
    end

    # def load_tutorials_section
    #   section_name = "tutorials"
    #   display_name = "Tutorials"
    #
    #   pages = [
    #     { id: 0, name: 'helloworld', repo: 'hyperstack-website', file: 'app/markdown/tutorial/helloworld.md',  allow_edit: true },
    #     { id: 1, name: 'todo', repo: 'todo-tutorial',     file: 'README.md',  allow_edit: true }
    #
    #   ]
    #   @section_stores[section_name] = SectionStore.new(pages, section_name, display_name)
    # end
  end

end
