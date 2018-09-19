class FilterList < Hyperloop::Component
  param :history

  render(DIV) do
    Sem.Segment do
      Sem.List { render_all_items }
    end
  end

  def render_all_items
    AppStore.section_stores.each do |section_hash|
      section_name = section_hash[0] #key
      section_store = section_hash[1] #value
      render_item_if_filtered section_store.display_name, "/docs/#{section_name}##{section_name}", section_name

      AppStore.section_stores[section_name].pages.each do |page|
        page_name = page[:name]
        page[:headings].each do |heading|
          slug = heading[:slug]
          render_item_if_filtered heading[:text], "/docs/#{section_name}/#{page_name}##{slug}", "#{section_name}/#{page_name}"
        end
      end
    end
  end

  def render_item_if_filtered(item, path, description)
    Sem.ListItem do
      Sem.ListHeader do
        A { item }
        .on(:click) do
          params.history.push "/#{AppStore.version}#{path}"
        end
      end
      Sem.ListDescription { description }
    end if item.upcase.include?(TocFilterStore.filter.upcase)
  end
end
