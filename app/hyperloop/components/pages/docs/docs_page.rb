class DocsPage < Hyperloop::Router::Component
  before_mount do
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
          # AppFooter()
          SearchResultModal(history: history)
        end
      end
    end
  end

  def main_content
      DIV(class: 'header segment') do
        DIV(class: 'container') do
          DIV(class: 'introductiontitle') do
            DIV(class: 'ui huge header') { "Hyperstack Docs" }
            P() { 'A modern web stack for people who love Ruby' }
          end
        end
      end

      DIV(class: 'main container') do
        render_side_bar_with_all_sections
        render_correct_page
      end

  end

  def render_side_bar_with_all_sections
    Sem.Rail(close: true, dividing: false, position: 'left') do
      ReactYahooSticky(enable: true, top: 50) do
        DIV(class: 'ui sticky visible transition') do
          accordion
        end
      end
    end
  end

  def render_correct_page
    puts "section_name: #{params.match.params[:section_name]}"
    puts "page_name: #{params.match.params[:page_name]}"
    puts "hash: #{history.location.hash}"
    if params.match.params[:section_name]
      PageBody(section_name: params.match.params[:section_name],
        page_name: params.match.params[:page_name] || '',
        page_anchor: history.location.hash || ''
      )
    else
      PageBody(section_name: 'docs_overview')
    end
  end

  def accordion
    Sem.Accordion(fluid: true, className: 'large pointing secondary vertical following menu main-accordion-container') do
      SiteStore.section_stores.each_with_index do |section, index|
        # puts section[1]
        unless section[1].exclude_from_toc?
          display_title(section, index).on(:click) do
            # newindex = (NavigationStore.main_accordion_index === index) ? -1 : index
            # NavigationStore.mutate.main_accordion_index newindex
            history.push "/docs/#{section[0]}"
          end
          Sem.AccordionContent(className: 'accordion-section-container',
            active: (params.match.params[:section_name] == section[0] ? true : false)) do
              PageToc(history: params.history, location: params.location, section_name: section[0],
                page_name: params.match.params[:page_name] || ''
              )
          end
        end
      end
    end
  end

  def display_title section, index
    Sem.AccordionTitle(className: 'main-accordion-title', index: index, active: true) do
      I(class: 'dropdown icon')
      B() { section[1].display_name }
    end
  end

end
