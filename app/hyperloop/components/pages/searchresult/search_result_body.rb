
class SearchResultBody < Hyperloop::Router::Component

  param :history
  param :location
  param :section

  after_mount do
    puts "search results body after mount"
    Element['html, body'].animate({
      scrollTop: 0
    }, :slow)
  end

  render do
    DIV(class: 'searchresultcontent') do
      SearchEngineStore.all_results.each_with_index do |result, index|

        resulthtmlparagraph = ""
        resultpagename = ""
        resultheadingname = ""
        resultheadingslug = ""
        resultsectionname = ""
        resultpageid = ""

        AppStore.section_stores[SearchEngineStore.previous_section_query].pages.each_with_index do |page, index|

          page[:headings].each do |heading|
            if (heading[:id] == result[:ref])
              resultsectionname = heading[:sectionname]
              resultpageid = heading[:pageid]
              resultpagename = heading[:pagename]
              resultheadingname = heading[:text]
              resultheadingslug = heading[:slug]
              resulthtmlparagraph = heading[:paragraphs].join(' ')
            end
          end
        end

        H2(class: 'ui header') do
          #IMG(src: 'dist/images/icons/gear.png')
          Sem.Icon(name: 'chevron right')
          DIV(class: 'content') do
            A() do
              DIV(dangerously_set_inner_HTML:
                { __html:
                  "#{index+1}. In #{resultpagename}: #{highlight(resultheadingname, result[:matchingwords]) } <a class='ui black label'>#{result[:nbresults]} results</a>"
                })

            end.on(:click) { gotoslug(resultheadingslug, resultsectionname, resultpageid) }

            # A(class:'ui black label') {"#{result[:nbresults]} results" }

            DIV(class: 'sub header') do
              "_______________"
            end

          end

        end

        DIV(dangerously_set_inner_HTML: { __html: highlight(resulthtmlparagraph, result[:matchingwords]) })
        BR()
      end
    end
  end

  def gotoslug slug, sectionname, pageid

    # NavigationStore.mutate.slug ""
    pagetogo = AppStore.section_stores[sectionname].pages[pageid]
    # AppStore.section_stores[sectionname].set_current_page pagetogo

    # NavigationStore.mutate.accordionindex pageid
    # NavigationStore.mutate.slug slug

    # history.push "/docs/#{params.section_name}/#{page[:name]}"
    # force_update!

    history.push "/#{AppStore.version}/docs/#{sectionname}/#{pagetogo[:name]}##{slug}"
    # force_update!

  end

  def highlight(text, search_string)
    keywords = search_string.strip.split(" ").compact.uniq
    #matcher = Regexp.new( '(' + keywords.join("|") + ')' )
    matcher = Regexp.new('\\b(' + keywords.join("|") + ')\\b')
    highlighted = text.gsub(matcher) { |match| "<a class='ui teal label'>#{match}</a>" }
    return highlighted
  end

end
