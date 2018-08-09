class SiteSearch < Hyperloop::Router::Component

  param :history
  param :section

  state results: []
  state searchinputvalue: ""
  state sectionselection: 'docs'
  #state searchwordselection: ''
  param onChange: nil

  param sectionoptions: [
    { key: 'docs', text: 'In Documentation', value: 'dsl_docs' },
    { key: 'start', text: 'In Get started', value: 'start' },
    { key: 'tutorials', text: 'In Tutorials', value: 'tutorials' }
  ]

  # param searchwordoptions: [
  #   { key: 'exact', text: 'Exact word', value: 'exact' },
  #   { key: 'partial', text: 'partial word', value: 'partial' }
  # ]

  after_mount do
    mutate.sectionselection params.section
    #mutate.searchwordselection 'exact'
  end

  render do
    search_control
  end

  def search_control
    Sem.Input(iconPosition: 'left', placeholder: 'Search ...', action: true) do
      INPUT(){}.on(:change) do |e|
       mutate.searchinputvalue e.target.value
      end

      Sem.Icon(name: 'search')
      Sem.Select(compact: false, options: params.sectionoptions.to_n).on :change do |e|

        mutate.sectionselection Hash.new(e.to_n)['value']
        #params.onChange.call(state.sectionselection) if params.onChange.present?
        # puts "SELECT #{state.sectionselection}"
        # `alert(#{e})`

        # test1 = e.target
        # `test2=#{test1}`
        # `alert(test2)`

        #test =  state.sectionselection.map{|element| Hash.new(element)}
        #puts "VALUE: #{test}"
      end

      Sem.Button() {'Search'}.on(:click) do
        if (state.searchinputvalue.length>4)
          if ( (SearchEngineStore.querystring != state.searchinputvalue) ||
             (SearchEngineStore.previoussectionquery != params.section) )

                SearchEngineStore.mutate.querystring state.searchinputvalue
                SearchEngineStore.mutate.previoussectionquery params.section
                SearchEngineStore.mutate.allresults nil

            SearchEngineStore.search_withlunr(params.section)
          end

          if (SearchEngineStore.allresults.empty?)
            alert("Sorry, no result found for { #{state.searchinputvalue} }")
          else
            params.history.push "/searchresult"
          end

        else
          alert("Search word too small, must be > 4")
        end
      end
    end
  end
end




########################################
##  CODE USED FOR Sem.Search

# def search_control_old
  #   Sem.Search(category: true, aligned: :left,
  #     resultRenderer: lambda { |obj| render_result(obj) },
  #     categoryRenderer: lambda { |obj| render_category(obj) },
  #     results: state.results,
  #     value: state.value,
  #     loading: !SiteStore.loaded?
  #   ) { }
  #   .on(:searchChange) do |e|
  #     mutate.value e.target.value
  #     if (e.target.value.length > 4)
  #       #mutate.results SiteStore.search_content(state.value, params.section).to_n
  #       resultat = SiteStore.search_content(state.value, params.section)
  #       puts "RESULTS: #{resultat[0][:results][0][:text]}"
  #     end
  #   end
  #   .on(:resultSelect) do |e, data|
  #     puts data.result.text
  #     mutate.value data.result.text
  #     SiteStore.sections[params.section].set_current_page data.result.page
  #         #params.history.push "/#{params.section}/#{page[:repo]}/#{page[:file]}"
  #     #force_update!
  #     #{}"/#{params.section}/#{data.result.repo}/#{data.result.file}"
  #     puts data.result.repo
  #     puts data.result.file
  #     puts data.result.slug
  #   end
  # end


  # def render_result obj
  #   SPAN do
  #     H4 { `obj.text` }
  #     EM { `obj.friendly_doc_name` }
  #   end.to_n
  #   #SearchResult().to_n
  # end

  # def render_category obj
  #   SPAN do
  #     H1 { `obj.name` }
  #     EM { "#{`obj.result_number`} results" }
  #   end.to_n

  # end
