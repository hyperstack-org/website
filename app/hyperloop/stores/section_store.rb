

class SectionStore < Hyperloop::Store

  state loaded: false

  def initialize pages, section_name, display_name

    @section_name = section_name
    @display_name = display_name
    @pages = pages

    load_and_convert_pages
    mutate.current_page @pages[0]

  end

  def section_name
    @section_name
  end

  def display_name
    @display_name
  end

  def pages
    @pages
  end

  def loaded?
    state.loaded
  end

  def current_page
    state.current_page
  end

  def current_anchor
    state.current_anchor
  end

  def set_current_page page
    mutate.current_page page
  end

  def set_current_anchor anchor
    mutate.current_anchor anchor
  end

  def raw_url page
    "https://raw.githubusercontent.com/hyperstack-org/#{page[:repo]}/master/#{page[:file]}"
  end

  def edit_url page
    "https://github.com/hyperstack-org/#{page[:repo]}/edit/edge/#{page[:file]}"
  end

  private

  def load_and_convert_pages
    @promises = 0

    @pages.each do |page|
      get(page)
    end
  end

  def get page
    @promises += 1

    HTTP.get( raw_url(page) ) do |response|
      puts "got page #{page}"
      if response.ok?
        converted = MdConverter.new(response.body, @section_name, @section_id, page[:id], page[:name])
        page[:headings] = converted.headings
        page[:friendly_doc_name] = converted.headings[0][:text]
        page[:code_blocks] = converted.code_blocks
        page[:html] = converted.html
        #page[:body] = page[:html].gsub(/<\/?[^>]*>/, "")
        page[:edit_url] = edit_url page
        page[:lunrsearchindex] = build_lunr_page_searchindex(page)

      else
        puts "Unable to get #{raw_url(page)} from Github"
      end

      @promises -= 1
      mutate.loaded true if @promises == 0
    end
  end

  def purify_text text
    puretext = text.gsub(/<\/?[^>]*>/, "")
                  .gsub(/\s+/, ' ')
                  .gsub(/&#39;/, ' ')
                  .gsub(/[^\w\d\_\?]/, ' ')
                  .strip
    return puretext
  end

  def build_lunr_page_searchindex page
    `lunrpageindex=[]`

    page[:headings].each_with_index do |heading, index|

      lunrheadingindex = `{
        "headingid": #{heading[:id]},
        "headingname": #{purify_text(heading[:text])},
        "text": #{purify_text(heading[:paragraphs].join(' '))}
      }`

      `lunrpageindex.push(#{lunrheadingindex});`
    end

    lunrpageindex =  `lunrpageindex`
    return lunrpageindex
  end
end
