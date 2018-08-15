class DocsPage < Hyperloop::Router::Component
  before_mount do
    Element['html, body'].scrollTop(0);
    # puts "#{Window.view.height}"
    # Element["#navigation-sidebar"].css('height', "#{Window.view.height}px")
    # puts "#{Element["#navigation-sidebar"].height}"
    # @section_name = 'docs'
    # @sidebar_component = PageToc(history: params.history, location: params.location, section_name: @section_name).as_node
    # # sidebar = TestMe().as_node
    # @body_component = PageBody(section_name: @section_name).as_node
  end

  render(DIV) do
    DIV(id: 'example', class: 'index') do
      # SidebarMenu()
      DIV(class: 'full height') do
        AppMenu(section: 'docs', history: history, location: location)
        DIV(class: 'page-wrap') do
          main_content
          loader unless SiteStore.loaded?
          # AppFooter()
          SearchResultModal(history: history)
        end
      end
    end
  end

  def loader
    Sem.Dimmer(active: true, inverted: true) do
      Sem.Loader(size: :large) {'Loading pages...'}
    end
  end

  def main_content
      # DIV(class: 'header segment') do
      #   DIV(class: 'container') do
      #     DIV(class: 'introductiontitle') do
      #       DIV(class: 'ui huge header') { "Hyperstack Docs" }
      #       P() { 'A modern web stack for people who love Ruby' }
      #     end
      #   end
      # end

      DIV(class: 'main container') do
        render_side_bar_with_all_sections
        render_correct_page
      end

  end

  def render_correct_page
    # puts "section_name: #{params.match.params[:section_name]}"
    # puts "page_name: #{params.match.params[:page_name]}"
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
    Sem.Rail(close: true, dividing: false, position: 'left') do
      ReactYahooSticky(enable: false, top: 100) do
        PerfectScrollbar.ScrollBar() do
          DIV(id: "navigation-sidebar", class: '') do
            accordion
          end
        end
      end
    end
  end

  def accordion
    Sem.Accordion(fluid: true, className: 'large pointing secondary vertical following menu main-accordion-container') do
      SiteStore.section_stores.each_with_index do |section_hash, index|
        section_name = section_hash[0] #key
        section_store = section_hash[1] #value
        is_active = params.match.params[:section_name] == section_name ? true : false

        unless section_store.exclude_from_toc?
          display_title(section_store.display_name, index, is_active).on(:click) do
            history.push "/docs/#{section_name}"
          end

          Sem.AccordionContent(className: 'accordion-section-container',
            active: is_active) do
              PageToc(history: params.history, location: params.location, section_name: section_name,
                page_name: params.match.params[:page_name] || ''
              )
          end
        end
      end
    end
  end

  def display_title display_name, index, is_active
    Sem.AccordionTitle(className: 'main-accordion-title', index: index, active: is_active) do
      I(class: 'dropdown icon')
      B() { display_name }.on(:click) do
        Element['html, body'].scrollTop(0);
      end
    end
  end

end
