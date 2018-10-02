require 'helpers/scroll'

class DocsPage < Hyperloop::Router::Component
  before_mount do
    @inverted_active = false
  end


  render(DIV) do
    AppMenu(section: 'docs', history: history)
    Sem.Divider(hidden: true)
    page_dimmer
    Sem.Container(fluid: false) do
      Sem.Grid(columns: 2, padded: false, container: false) do
        Sem.GridColumn(width: 5) { render_side_bar_with_all_sections }
        Sem.GridColumn(width: 11) { render_correct_page }
      end
    end
    Sem.Divider(hidden: true)
    AppFooter()
    SearchResultModal(history: history)
  end

  def page_dimmer
    Sem.Dimmer(active: !(AppStore.loaded? || AppStore.errors?), inverted: true) do
      Sem.Loader(size: :large) {'Loading pages...'}
    end
  end

  def render_correct_page
    if params.match.params[:section_name]
      PageBody(section_name: params.match.params[:section_name],
        page_name: params.match.params[:page_name] || '',
        page_anchor: history.location.hash || ''
      )
    else
      PageBody(section_name: 'docs_overview')
    end
  end

  def render_side_bar_with_all_sections
      Filter()
      if TocFilterStore.show_filter_list
        BR()
        FilterList(history: history)
      else
        accordion
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
            display_title(section_name, section_store.display_name, index, is_active)
          end
          .on(:click) do
            history.push "/#{AppStore.version}/docs/#{section_name}"
          end

          Sem.AccordionContent(active: is_active) do
              PageToc(history: params.history, location: params.location, section_name: section_name,
                page_name: params.match.params[:page_name] || ''
              )
          end
        end
      end
    end
  end

  def display_title section_name, display_name, index, is_active
    I(class: 'dropdown icon')
    B() { display_name }.on(:click) do
      if params.match.params[:section_name] == section_name
        @inverted_active = !@inverted_active
      else
        @inverted_active = false
      end
      # Element['html, body'].scrollTop(0);
    end
  end

end
