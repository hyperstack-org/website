module HS2Docs
  def load_all_docs
    load_overview_section
    load_start_section
    load_dsl_section
    load_installation_section
    # load_tools_section
    # load_tutorials_section
  end

  def load_overview_section
    section_name = 'docs_overview'
    display_name = 'Overview'

    pages = [
      { id: 0, name: 'overview', repo: 'hs2', file: 'docs/docs_overview.md',  allow_edit: true },
    ]
    @section_stores[section_name] = SectionStore.new(exclude_from_toc: true, pages: pages,
                                                    section_name: section_name, display_name: display_name)
  end

  def load_start_section
    section_name = 'start'
    display_name = 'Getting Started'

    pages = [
      { id: 0, name: 'components', repo: 'hs2',     file: 'docs/start/components.md',  allow_edit: true },
      { id: 1, name: 'stores', repo: 'hs2',     file: 'docs/start/stores.md',  allow_edit: true },
      { id: 2, name: 'models', repo: 'hs2',     file: 'docs/start/models.md',  allow_edit: true },
      { id: 3, name: 'operations', repo: 'hs2',     file: 'docs/start/operations.md',  allow_edit: true },
    ]
    @section_stores[section_name] = SectionStore.new(pages: pages, section_name: section_name, display_name: display_name)
  end

  def load_dsl_section
    section_name = 'dsl'
    display_name = 'Hyperstack DSL'

    pages = [
      { id: 0, name: 'components', repo: 'hs2',     file: 'docs/dsl/hyper-component.md',  allow_edit: true },
      { id: 1, name: 'stores', repo: 'hs2',     file: 'docs/dsl/hyper-store.md',  allow_edit: true },
      { id: 2, name: 'models', repo: 'hs2',      file: 'docs/dsl/hyper-model.md',  allow_edit: true },
      { id: 3, name: 'router', repo: 'hs2',    file: 'docs/dsl/hyper-router.md',  allow_edit: true },
      # { id: 4, name: 'operations', repo: 'hs2', file: 'docs/dsl/hyper-operation.md',  allow_edit: true },
    ]
    @section_stores[section_name] = SectionStore.new(pages: pages, section_name: section_name, display_name: display_name)
  end

  def load_installation_section
    section_name = 'installation'
    display_name = 'Installation & Setup'

    pages = [
      { id: 0, name: 'installation', repo: 'hs2', file: 'docs/installation/installation.md',  allow_edit: true }
    ]
    @section_stores[section_name] = SectionStore.new(pages: pages, section_name: section_name, display_name: display_name)
  end

  def load_tools_section
    section_name = 'tools'
    display_name = 'Tools, Tips & Debugging'

    pages = [
      { id: 0, name: 'tools', repo: 'hs2', file: 'docs/tools/tools.md',  allow_edit: true },
      { id: 1, name: 'tips', repo: 'hs2', file: 'docs/tools/tips.md',  allow_edit: true },
      { id: 2, name: 'debugging', repo: 'hs2', file: 'docs/tools/debugging.md',  allow_edit: true }
    ]
    @section_stores[section_name] = SectionStore.new(pages: pages, section_name: section_name, display_name: display_name)
  end

  def load_tutorials_section
    section_name = "tutorials"
    display_name = "Tutorials"

    pages = [
      { id: 0, name: 'helloworld', repo: 'hs2', file: 'docs/tutorial/helloworld.md',  allow_edit: true },
      { id: 1, name: 'todo', repo: 'hs2', file: 'docs/tutorial/todo.md',  allow_edit: true },
      { id: 3, name: 'community', repo: 'hs2', file: 'docs/tutorial/community.md',  allow_edit: true }

    ]
    @section_stores[section_name] = SectionStore.new(pages: pages, section_name: section_name, display_name: display_name)
  end
end
