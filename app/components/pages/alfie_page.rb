class AlfiePage < Hyperloop::Router::Component

  before_mount do
    # @section_name = 'docs'
    # @sidebar_component = PageToc(history: params.history, location: params.location, section: @section_name).as_node
    # # sidebar = TestMe().as_node
    # @body_component = PageBody(section: @section_name).as_node
  end

  render(DIV) do
    # PageLayout(sidebar_component: sidebar,
    #           body_component: body,
    #           page_title: "Alfie page",
    #           section: section_name,
    #           loaded: SiteStore.sections[section_name].loaded?,
    #           history: params.history,
    #           location: params.location)

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
            DIV(class: 'ui huge header') { "params.page_title" }
            P() { 'The Complete Isomorphic Ruby Framework' }
          end
        end
      end

      DIV(class: 'main container') do
        # @sidebar_component.render
        render_side_bar_with_all_sections
        render_correct_page
        # @body_component.render
      end
  end

  def render_side_bar_with_all_sections
    sections = ['start', 'docs', 'installation', 'gems', 'tools']
    Sem.Rail(close: true, dividing: false, position: 'left') do
      ReactYahooSticky(enable: true, top: 50) do
        accordion sections
      end
    end
  end

  def render_correct_page
    # H1 { "#{params.match.params[:section]}" }
    # H1 { "#{params.match.params[:page]}" }
    # H1 { "#{params.match.params[:slug]}" }
    PageBody(section: params.match.params[:section]) if params.match.params[:section]
    # this is where we shound navigate to the correct place
  end

  def accordion sections
    Sem.Accordion(fluid: true, className: 'large pointing secondary vertical following menu') do
      sections.each_with_index do |section, index|
        display_title(section, index).on(:click) do
          newindex = (NavigationStore.main_accordion_index === index) ? -1 : index
          NavigationStore.mutate.main_accordion_index newindex
        end

        Sem.AccordionContent(className: 'menu', active: (NavigationStore.state.main_accordion_index === index)) do
        # P { 'content here' }
        PageToc(history: params.history, location: params.location, section: section)
        end
      end
    end
  end

  def display_title section, index
    Sem.AccordionTitle(className: 'alfie', index: index, active: (NavigationStore.main_accordion_index === index)) do
      I(class: 'dropdown icon')
      B() { section }
    end
  end

end
