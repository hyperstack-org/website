class DocsPage < Hyperloop::Router::Component
  before_mount do
    # @section_name = 'docs'
    # @sidebar_component = PageToc(history: params.history, location: params.location, section: @section_name).as_node
    # # sidebar = TestMe().as_node
    # @body_component = PageBody(section: @section_name).as_node
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
        accordion
      end
    end
  end

  def render_correct_page
    # H1 { "#{params.match.params[:section]}" }
    # H1 { "#{params.match.params[:page]}" }
    # H1 { "#{params.match.params[:slug]}" }
    if params.match.params[:section]
      PageBody(section: params.match.params[:section])
    else
      DocsOverviewPage()
    end
    # this is where we shound navigate to the correct place
  end

  def accordion
    Sem.Accordion(fluid: true, className: 'large pointing secondary vertical following menu') do
      SiteStore.sections.each_with_index do |section, index|

        display_title(section, index).on(:click) do
          newindex = (NavigationStore.main_accordion_index === index) ? -1 : index
          NavigationStore.mutate.main_accordion_index newindex
        end

        Sem.AccordionContent(className: 'menu', active: (NavigationStore.state.main_accordion_index === index)) do
          PageToc(history: params.history, location: params.location, section: section[0])
        end
      end
    end
  end

  def display_title section, index
    Sem.AccordionTitle(className: 'main_accordion', index: index, active: (NavigationStore.main_accordion_index === index)) do
      I(class: 'dropdown icon')
      B() { section[1].display_name }
    end
  end

end
