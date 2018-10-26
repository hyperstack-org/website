class SearchEngineStore < Hyperloop::Store

  class << self

    state querystring: "", scope: :shared, reader: true
    state previous_section_query: "", scope: :shared, reader: true
    state all_results: [], scope: :shared, reader: true
    state nbresults: 0, scope: :shared, reader: true
    state lunr_section_searchindex: Hash.new { |h, k| h[k] = '' }, scope: :shared, reader: true

    def search_withlunr section
      puts "search_withlunr: section= #{section}"
      if SearchEngineStore.lunr_section_searchindex[section].empty?
        build_lunr_section_searchindex(section)
      end

      globalIndex = SearchEngineStore.lunr_section_searchindex[section]
      jssearchresults = `Searchquery(Lunrindex(#{globalIndex}), #{globalIndex}, #{state.querystring})`
      searchresults = jssearchresults.map{|element| Hash.new(element)}

      nbresults = 0
      searchresults.each do |searchresult|
        nbresults += searchresult[:nbresults]
      end

      SearchEngineStore.mutate.nbresults nbresults

      sortedresults =  searchresults.sort_by { |hsh| hsh[:ref] }
      mutate.all_results sortedresults
    end

    def build_lunr_section_searchindex section
      puts 'build_lunr_section_searchindex section'
        `lunrsectionindex=[]`
        AppStore.section_stores[section].pages.each do |page|
            `lunrsectionindex = lunrsectionindex.concat(#{page[:lunrsearchindex]});`
        end
        SearchEngineStore.mutate.lunr_section_searchindex[section] = `lunrsectionindex`
    end

    # def search_content sectionname


    #   data = []

    #   a = {}
    #   a[:name] = sectionname

    #   a[:results] = []
    #   pages = AppStore.section_stores[sectionname].pages

    #     pages.each do |page|
    #       a[:results].concat( match_content(state.inputvalue, page) )
    #       #puts "PAGE: #{page[:friendly_doc_name]} #{a[:results]}"
    #     end


    #     data << a unless a[:results].size == 0

    #     a[:result_number] = a[:results].size.to_s
    #     #puts data[0]
    #     mutate.all_results data
    #     #puts data[0][:name]

    # end



    # private

    # def match_content value, page
    #   ret = []
    #   result_item = {}
    #   keyindex = 0
    #   search_regex = Regexp.new('(\W|^)'+value.downcase+'(\W|$)')
    #   content = page['body']

    #   search_content_result = excerpt(content.downcase, search_regex, radius: 30)

    #   begin
    #   #if (!search_content_result.nil?)
    #     #puts "search_content_result #{search_content_result[:result_item_text]}"
    #     result_item[:text] = search_content_result[:result_item_text]
    #     result_item[:friendly_doc_name] = page[:friendly_doc_name]
    #     result_item[:repo] = page[:repo]
    #     result_item[:file] = page[:file]
    #     #result_item[:page] = page
    #     result_item[:key] = "#{result_item[:repo]}-#{result_item[:file]}-#{keyindex+=1}"
    #     #puts "KEY: #{result_item}"
    #     ret << result_item
    #     #puts "RET : #{ret}"


    #     content_part = search_content_result[:sliced_content]
    #     search_content_result = excerpt(content_part, search_regex, radius: 30)
    #     result_item = {}

    #   end while !search_content_result.nil?

    #   ret
    # end




    # def cut_excerpt_part(part_position, part, separator, options)
    #   return "", "" unless part

    #   radius   = options.fetch(:radius, 100)
    #   omission = options.fetch(:omission, "...")

    #   part = part.split(separator)
    #   part.delete("")
    #   affix = part.size > radius ? omission : ""

    #   part = if part_position == :first
    #     drop_index = [part.length - radius, 0].max
    #     part.drop(drop_index)
    #   else
    #     part.first(radius)
    #   end

    #   return affix, part.join(separator)
    # end



    # def excerpt(text, phrase, options = {})

    #     excerptarray = {}

    #     return unless text && phrase

    #     separator = options.fetch(:separator, nil) || ""
    #     case phrase
    #     when Regexp
    #       regex = phrase
    #     else
    #       regex = /#{Regexp.escape(phrase)}/
    #     end

    #     return unless matches = text.match(regex)
    #     phrase = matches[0]


    #     unless separator.empty?
    #       text.split(separator).each do |value|
    #         if value.match(regex)
    #           regex = phrase = value
    #           break
    #         end
    #       end
    #     end


    #     first_part, second_part = text.split(phrase, 2)
    #     excerptarray[:sliced_content] = second_part


    #     #puts "PHRASE: #{phrase}"
    #     # puts "FIRST PART #{second_part}"

    #     prefix, first_part   = cut_excerpt_part(:first, first_part, separator, options)
    #     postfix, second_part = cut_excerpt_part(:second, second_part, separator, options)

    #     #puts "FIRST PART #{first_part}"

    #     affix = [first_part, separator, phrase, separator, second_part].join.strip
    #     excerptarray[:result_item_text] = [prefix, affix, postfix].join

    #     #puts excerptarray[1]

    #     return excerptarray
    #   end




  end

end
