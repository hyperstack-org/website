class PageToc < Hyperloop::Component
  param :history
  param :location
  param :section_name
  param page_name: ''

  before_mount do
    # if (NavigationStore.accordionindex < 0)
      # NavigationStore.mutate.accordionindex(-1)
    # end
  end

  render do
    # # Sem.Rail(close: true, dividing: false, position: 'left') do
    #   ReactYahooSticky(enable: true, top: 50) do
    #     DIV(class: 'ui sticky visible transition') do
          accordion if SiteStore.section_stores[params.section_name] && SiteStore.section_stores[params.section_name].loaded?
          # puts params.section_name
      #   end
      # end
    # end
  end

  def display_title page, index
    Sem.AccordionTitle(className: 'item accordion-section-heading0', index: index, active: (page[:name] == params.page_name ? true : false)) do
      I(class: 'dropdown icon')
      B() { page[:headings][0][:text] }
    end
  end

  def navigate_to_page page, index
    puts "navigate_to_page"
    # newindex = (NavigationStore.accordionindex === index) ? -1 : index
    # NavigationStore.mutate.accordionindex newindex
     Element['html, body'].animate({
       scrollTop: 0
     }, :slow)
    # SiteStore.section_stores[params.section_name].set_current_page page
    # NavigationStore.mutate.slug ""
    params.history.push "/docs/#{params.section_name}/#{page[:name]}"
    force_update!
  end

  def navigate_to_heading page, heading
    # puts "navigate_to_heading"
    slug = "#{heading[:slug]}"
    params.history.push "/docs/#{params.section_name}/#{page[:name]}##{slug}"
    force_update!
    # NavigationStore.mutate.slug slug
  end

  def accordion
    Sem.Accordion(fluid: true, className: 'large pointing secondary vertical following menu') do
      SiteStore.section_stores[params.section_name].pages.each_with_index do |page, index|
        display_title(page, index).on(:click) do
          navigate_to_page(page, index)
        end

        Sem.AccordionContent(className: '',
          active: (page[:name] == params.page_name ? true : false)) do
          page[:headings].drop(1).each do |heading|
            if (heading[:level] < 4)
              A(class: "item accordion-section-item #{'accordion-section-subitem' if (heading[:level]==3)}") { heading[:text] }
                .on(:click) do
                  navigate_to_heading page, heading
                end
            end
          end
        end
      end
    end
  end
end
