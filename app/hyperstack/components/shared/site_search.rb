# class SiteSearch < Hyperloop::Component
#
#   param :history
#   param :section
#
#   state results: []
#   state search_input_value: ""
#   state section_selection: 'docs'
#   param onChange: nil
#
#   param section_options: [
#     { key: 'docs', text: 'In Documentation', value: 'docs' },
#     { key: 'start', text: 'In Get started', value: 'start' },
#     { key: 'tutorials', text: 'In Tutorials', value: 'tutorials' }
#   ]
#
#   after_mount do
#     mutate.section_selection params.section
#   end
#
#   render do
#     search_control
#   end
#
#   def search_control
#     Sem.Input(iconPosition: 'left', placeholder: 'Search DSL docs...', action: true) do
#       INPUT(){}.on(:change) do |e|
#        mutate.search_input_value e.target.value
#       end
#
#       Sem.Icon(name: 'search')
#       # Sem.Select(compact: false, options: params.section_options.to_n).on :change do |e|
#       #
#       #   mutate.section_selection Hash.new(e.to_n)['value']
#       # end
#
#       Sem.Button() {'Search'}.on(:click) do
#         if (state.search_input_value.length > 1)
#           if ( (SearchEngineStore.querystring != state.search_input_value) ||
#              (SearchEngineStore.previous_section_query != params.section) )
#
#                 SearchEngineStore.mutate.querystring state.search_input_value
#                 SearchEngineStore.mutate.previous_section_query params.section
#                 SearchEngineStore.mutate.all_results nil
#
#             # SearchEngineStore.search_withlunr(params.section)
#             # this is a hack to only search thr dsl section
#             SearchEngineStore.mutate.querystring state.search_input_value
#             SearchEngineStore.mutate.previous_section_query 'dsl'
#             SearchEngineStore.mutate.all_results nil
#             SearchEngineStore.search_withlunr('dsl')
#
#           end
#
#           if (SearchEngineStore.all_results.empty?)
#             alert("Sorry, no result found for { #{state.search_input_value} }")
#           else
#             params.history.push "/searchresult"
#           end
#
#         else
#           alert("Search word too small, must be > 1")
#         end
#       end
#     end
#   end
# end
#
#
# ########################################
# ##  CODE USED FOR old filer of TOC
#
# # def search_control_old
#   #   Sem.Search(category: true, aligned: :left,
#   #     resultRenderer: lambda { |obj| render_result(obj) },
#   #     categoryRenderer: lambda { |obj| render_category(obj) },
#   #     results: state.results,
#   #     value: state.value,
#   #     loading: !AppStore.loaded?
#   #   ) { }
#   #   .on(:searchChange) do |e|
#   #     mutate.value e.target.value
#   #     if (e.target.value.length > 4)
#   #       #mutate.results AppStore.search_content(state.value, params.section).to_n
#   #       resultat = AppStore.search_content(state.value, params.section)
#   #       puts "RESULTS: #{resultat[0][:results][0][:text]}"
#   #     end
#   #   end
#   #   .on(:resultSelect) do |e, data|
#   #     puts data.result.text
#   #     mutate.value data.result.text
#   #     AppStore.section_stores[params.section].set_current_page data.result.page
#   #         #params.history.push "/#{params.section}/#{page[:repo]}/#{page[:file]}"
#   #     #force_update!
#   #     #{}"/#{params.section}/#{data.result.repo}/#{data.result.file}"
#   #     puts data.result.repo
#   #     puts data.result.file
#   #     puts data.result.slug
#   #   end
#   # end
#
#
#   # def render_result obj
#   #   SPAN do
#   #     H4 { `obj.text` }
#   #     EM { `obj.friendly_doc_name` }
#   #   end.to_n
#   #   #SearchResult().to_n
#   # end
#
#   # def render_category obj
#   #   SPAN do
#   #     H1 { `obj.name` }
#   #     EM { "#{`obj.result_number`} results" }
#   #   end.to_n
#
#   # end
