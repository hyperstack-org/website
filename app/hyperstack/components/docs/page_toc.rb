class PageToc < HyperComponent
  param :location
  param :section_name
  param page_name: ''

  before_mount do
    @inverted_active = false
  end

  render(DIV) do
    render_section if AppStore.section_stores[@SectionName] &&
         AppStore.section_stores[@SectionName].loaded? &&
         AppStore.section_stores[@SectionName].pages.any?
  end

  def render_section
    AppStore.section_stores[@SectionName].pages.each_with_index do |page, index|
      if page[:processed]
        is_active = page[:name] == @PageName ? true : false
        is_active = !is_active if @inverted_active && page[:name] == @PageName

        section_title page, index, is_active
        section_content page, index, is_active
      else
        message =  "Skipping unprocessed page #{page[:file]}"
        message = message # skip linter warning
        `console.warn(message);`
      end
    end
  end

  def section_title page, index, is_active
    A do
      display_title(page, index, is_active)
    end
    .on(:click) do
      navigate_to_page(page, index)
    end
  end

  def section_content page, index, is_active
    Sem.List(bulleted: true) do
      page[:headings].drop(1).each do |heading|
        if (heading[:level] < 3)
          link_id = "#{@SectionName}_#{page[:name]}_#{heading[:slug]}"
          selected_class = (TocStore.visible_id == heading[:slug] ? 'toc-scrollspy' : '')
          # puts "#{TocStore.visible_id} == #{heading[:slug]}"
          Sem.ListItem do
            A(class: "dark-gray-text #{selected_class}", id: "#{link_id}") { "#{heading[:text]}" }
            .on(:click) do
              navigate_to_heading page, heading
            end
          end
        end
      end
    end
  end

  def display_title page, index, is_active
    DIV { page[:headings][0][:text] }
  end

  def navigate_to_page page, index
    AppStore.history.push "/#{AppStore.version}/docs/#{@SectionName}/#{page[:name]}"
    if @PageName == page[:name]
      @inverted_active = !@inverted_active
    else
      @inverted_active = false
    end
  end

  def navigate_to_heading page, heading
    slug = "#{heading[:slug]}"
    puts "navigate_to_heading #{slug}"
    TocStore.visible_id = slug
    AppStore.history.push "/#{AppStore.version}/docs/#{@SectionName}/#{page[:name]}##{slug}"
  end
end
