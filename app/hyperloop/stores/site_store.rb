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
      load_docs_section
      load_installation_section
      load_gems_section
      load_tools_section
      # load_tutorials_section
    end

    def load_start_section
      section_name = "start"

      pages = [
        { id: 0, name: 'components', repo: 'hyperloop-website',     file: 'pages/start/components.md',  allow_edit: true },
        { id: 1, name: 'stores', repo: 'hyperloop-website',     file: 'pages/start/stores.md',  allow_edit: true },
        { id: 2, name: 'models', repo: 'hyperloop-website',     file: 'pages/start/models.md',  allow_edit: true },
        { id: 3, name: 'operations', repo: 'hyperloop-website',     file: 'pages/start/operations.md',  allow_edit: true },
        { id: 4, name: 'policies', repo: 'hyperloop-website',     file: 'pages/start/policies.md',  allow_edit: true },
        { id: 5, name: 'pradgmatic', repo: 'hyperloop-website',     file: 'pages/start/pradgmatic.md',  allow_edit: true }
      ]
      @section_stores[section_name] = SectionStore.new(pages, section_name)
    end

    def load_docs_section
      section_name = "docs"

      pages = [
        { id: 0, name: 'components', repo: 'hyper-react',     file: 'DOCS.md',  allow_edit: true },
        { id: 1, name: 'stores', repo: 'hyper-store',     file: 'DOCS.md',  allow_edit: true },
        { id: 2, name: 'router', repo: 'hyper-router',    file: 'DOCS.md',  allow_edit: true },
        { id: 3, name: 'models', repo: 'hyper-mesh',      file: 'DOCS.md',  allow_edit: true },
        { id: 4, name: 'operations', repo: 'hyper-operation', file: 'DOCS.md',  allow_edit: true },
        { id: 5, name: 'policies', repo: 'hyper-operation', file: 'DOCS-POLICIES.md',  allow_edit: true },
        { id: 6, name: 'dummy', repo: 'hyperloop-website', file: 'dist/dummy_DOCS.md',  allow_edit: true }
      ]
      @section_stores[section_name] = SectionStore.new(pages, section_name)
    end

    def load_installation_section
      section_name = "installation"

      pages = [
        { id: 0, name: 'installation', repo: 'hyperloop-website', file: 'pages/installation/overview.md',  allow_edit: true }
      ]
      @section_stores[section_name] = SectionStore.new(pages, section_name)
    end

    def load_gems_section
      section_name = "gems"

      pages = [
        { id: 0, name: 'gems', repo: 'hyperloop-website', file: 'pages/gems/gems.md',  allow_edit: true }
      ]
      @section_stores[section_name] = SectionStore.new(pages, section_name)
    end

    def load_tools_section
      section_name = "tools"

      pages = [
        { id: 0, name: 'tools', repo: 'hyperloop-website', file: 'pages/tools/tools.md',  allow_edit: true }
      ]
      @section_stores[section_name] = SectionStore.new(pages, section_name)
    end

    def load_tutorials_section
      section_name = "tutorials"

      pages = [
        { id: 0, name: 'helloworld', repo: 'hyperloop-website', file: 'pages/tutorial/helloworld.md',  allow_edit: true },
        { id: 1, name: 'todo', repo: 'todo-tutorial',     file: 'README.md',  allow_edit: true }

      ]
      @section_stores[section_name] = SectionStore.new(pages, section_name)
    end
  end

end
