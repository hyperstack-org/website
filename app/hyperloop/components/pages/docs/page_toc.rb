class PageToc < Hyperloop::Component
  param :history
  param :location
  param :section_name
  param page_name: ''

  before_mount do
    @inverted_active = false
  end

  render do
    accordion if SiteStore.section_stores[params.section_name] && SiteStore.section_stores[params.section_name].loaded?
  end

  def accordion
    Sem.Accordion(fluid: true, className: 'large pointing secondary vertical following menu') do
      SiteStore.section_stores[params.section_name].pages.each_with_index do |page, index|
        is_active = page[:name] == params.page_name ? true : false
        is_active = !is_active if @inverted_active && page[:name] == params.page_name

        Sem.AccordionTitle(className: 'item accordion-section-heading0', index: index, active: is_active) do
          display_title(page, index, is_active)
        end.on(:click) do
          navigate_to_page(page, index)
        end

        Sem.AccordionContent(className: '', active: is_active) do
          page[:headings].drop(1).each do |heading|
            if (heading[:level] < 4)
              subitem_before = ""
              if (heading[:level]==3)
                subitemclass = "accordion-section-subitem"
                subitem_before = ""
              end
              link_id = "#{params.section_name}_#{page[:name]}_#{heading[:slug]}"
              A(id: "#{link_id}", class: "item accordion-section-item #{subitemclass}") { "#{subitem_before}#{heading[:text]}" }
              .on(:click) do
                navigate_to_heading page, heading
                Element["a.item"].removeClass("active-link-item")
                Element["##{link_id}"].addClass("active-link-item")
              end
            end
          end
        end
      end
    end
  end

  def display_title page, index, is_active
    I(class: 'dropdown icon')
    B() { page[:headings][0][:text] }
  end

  def navigate_to_page page, index
    Element['html, body'].scrollTop(0);
    params.history.push "/docs/#{params.section_name}/#{page[:name]}"
    if params[:page_name] == page[:name]
      @inverted_active = !@inverted_active
    else
      @inverted_active = false
    end
  end

  def navigate_to_heading page, heading
    slug = "#{heading[:slug]}"
    params.history.push "/docs/#{params.section_name}/#{page[:name]}##{slug}"
  end
end
