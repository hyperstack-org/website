class FilterList < Hyperloop::Component
  param :history

  render(DIV) do
    Sem.Segment do
      Sem.List do
        render_all_items
      end
    end
  end

  def render_all_items
    SiteStore.section_stores.each do |section_hash|
      section_name = section_hash[0] #key
      section_store = section_hash[1] #value
      render_item section_store.display_name, "/docs/#{section_name}", section_name

      SiteStore.section_stores[section_name].pages.each do |page|
        render_item page[:headings][0][:text], "/docs/#{section_name}/#{page[:name]}", "#{section_name}/#{page[:name]}"

        page[:headings].drop(1).each do |heading|
          slug = "#{heading[:slug]}"
          render_item heading[:text], "/docs/#{section_name}/#{page[:name]}##{slug}", "#{section_name}/#{page[:name]}"
        end
      end
    end
  end

  def render_item item, path, description
    if item.upcase.include?(TocFilterStore.filter.upcase)
      Sem.ListItem do
        Sem.ListHeader do
          A { item }
          .on(:click) do
            params.history.push path
          end
        end
        Sem.ListDescription { description }
      end
    end
  end

end
