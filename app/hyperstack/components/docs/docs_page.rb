class DocsPage < HyperComponent
  before_mount do
    @inverted_active = false
  end

  render(DIV) do
    AppMenu(section: 'docs')
    Sem.Divider(hidden: true)
    page_dimmer
    Sem.Container(fluid: false) do
      DIV(class: 'Container') do
        render_side_bar_with_all_sections
        render_correct_page
      end
    end
    Sem.Divider(hidden: true)
    AppFooter()
    # SearchResultModal()
  end

  def page_dimmer
    Sem.Dimmer(active: !(AppStore.loaded? || AppStore.errors?), inverted: true) do
      Sem.Loader(size: :large) {'Loading pages...'}
    end
  end

  def render_side_bar_with_all_sections
    DIV(class: 'Left') do
      Filter()
      if TocFilterStore.show_filter_list
        DIV(class: :block) { FilterList() }
      else
        DIV(class: :block) { accordion }
      end
    end
  end

  def accordion
    Sem.Accordion(styled: false) do
      AppStore.section_stores.each_with_index do |section_hash, index|
        section_name = section_hash[0] #key
        section_store = section_hash[1] #value

        is_active = params.match.params[:section_name] == section_name ? true : false
        is_active = !is_active if @inverted_active && params.match.params[:section_name] == section_name

        unless section_store.exclude_from_toc?
          Sem.AccordionTitle(index: index, active: is_active) do
            accordion_display_title(section_name, section_store.display_name, index, is_active)
          end
          .on(:click) do
            AppStore.history.push "/#{AppStore.version}/docs/#{section_name}"
          end

          Sem.AccordionContent(active: is_active) do
              PageToc(location: params.location, section_name: section_name,
                page_name: params.match.params[:page_name] || ''
              )
          end
        end
      end
    end
  end

  def accordion_display_title section_name, display_name, index, is_active
    A(class: 'dark-gray-text') do
      I(class: 'dropdown icon')
      SPAN { display_name }
    end
    .on(:click) do
      if params.match.params[:section_name] == section_name
        @inverted_active = !@inverted_active
      else
        @inverted_active = false
      end
    end
  end

  def render_correct_page
    DIV(class: 'Middle', id: 'docs-page-content') do
      if params.match.params[:section_name]
        PageBody(section_name: params.match.params[:section_name],
          page_name: params.match.params[:page_name] || '',
          page_anchor: AppStore.history.location.hash || ''
        )
      else
        PageBody(section_name: 'docs_overview')
      end
    end
  end
end
