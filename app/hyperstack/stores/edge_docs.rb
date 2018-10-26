module EdgeDocs
  def load_all_docs
    load_overview_section
    load_installation_section
    load_dsl_client
    load_dsl_isomorphic
    load_tools_section
    load_tutorials_section
  end

  def load_overview_section
    section_name = 'docs_overview'
    display_name = 'Overview'

    pages = [
      { id: 0, name: 'overview', repo: 'hyperstack', file: 'docs/readme.md',  allow_edit: true },
    ]
    @section_stores[section_name] = SectionStore.new(exclude_from_toc: true, pages: pages,
                                                    section_name: section_name, display_name: display_name)
  end

  def load_dsl_client
    section_name = 'dsl-client'
    display_name = 'Client-side DSL Concepts'

    pages = [
      { id: 0, name: 'components', repo: 'hyperstack',     file: 'docs/dsl-client/hyper-component.md',  allow_edit: true },
      { id: 1, name: 'stores', repo: 'hyperstack',     file: 'docs/dsl-client/hyper-store.md',  allow_edit: true },
      { id: 2, name: 'router', repo: 'hyperstack',    file: 'docs/dsl-client/hyper-router.md',  allow_edit: true }
    ]
    @section_stores[section_name] = SectionStore.new(pages: pages, section_name: section_name, display_name: display_name)
  end

  def load_dsl_isomorphic
    section_name = 'dsl-isomorphic'
    display_name = 'Isomorphic DSL Concepts'

    pages = [
      { id: 1, name: 'models', repo: 'hyperstack',      file: 'docs/dsl-isomorphic/hyper-model.md',  allow_edit: true },
      { id: 2, name: 'operations', repo: 'hyperstack', file: 'docs/dsl-isomorphic/hyper-operation.md',  allow_edit: true },
      { id: 3, name: 'policies', repo: 'hyperstack', file: 'docs/dsl-isomorphic/hyper-policy.md',  allow_edit: true }
    ]
    @section_stores[section_name] = SectionStore.new(pages: pages, section_name: section_name, display_name: display_name)
  end

  def load_installation_section
    section_name = 'installation'
    display_name = 'Installation'

    pages = [
      { id: 0, name: 'installation', repo: 'hyperstack', file: 'install/readme.md',  allow_edit: true },
      { id: 1, name: 'upgrading', repo: 'hyperstack', file: 'docs/installation/upgrading.md',  allow_edit: true },
      { id: 2, name: 'config', repo: 'hyperstack', file: 'docs/installation/config.md',  allow_edit: true }
    ]
    @section_stores[section_name] = SectionStore.new(pages: pages, section_name: section_name, display_name: display_name)
  end

  def load_tools_section
    section_name = 'tools'
    display_name = 'Tools, Testing & Debugging'

    pages = [
      { id: 0, name: 'tools', repo: 'hyperstack', file: 'docs/tools/tools.md',  allow_edit: true },
      { id: 1, name: 'tips', repo: 'hyperstack', file: 'docs/tools/tips.md',  allow_edit: true },
      { id: 2, name: 'debugging', repo: 'hyperstack', file: 'docs/tools/debugging.md',  allow_edit: true },
      { id: 3, name: 'specs', repo: 'hyperstack', file: 'docs/tools/hyper-spec.md',  allow_edit: true },
      { id: 4, name: 'i18n', repo: 'hyperstack', file: 'docs/tools/hyper-i18n.md',  allow_edit: true }
    ]
    @section_stores[section_name] = SectionStore.new(pages: pages, section_name: section_name, display_name: display_name)
  end

  def load_tutorials_section
    section_name = "tutorials"
    display_name = "Tutorials"

    pages = [
      { id: 0, name: 'helloworld', repo: 'hyperstack', file: 'docs/tutorial/helloworld.md',  allow_edit: true },
      { id: 1, name: 'todo', repo: 'hyperstack', file: 'docs/tutorial/todo.md',  allow_edit: true },
      { id: 2, name: 'community', repo: 'hyperstack', file: 'docs/tutorial/community.md',  allow_edit: true }

    ]
    @section_stores[section_name] = SectionStore.new(pages: pages, section_name: section_name, display_name: display_name)
  end
end
