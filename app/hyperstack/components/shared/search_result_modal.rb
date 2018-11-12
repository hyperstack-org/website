#require '../../operations/search_result_modal_op.rb'

# class SearchResultModal < Hyperloop::Component
#
#   param :history
#
#   state visible: false, scope: :shared, reader: true
#
#
#
#   def self.open
#     mutate.visible true
#   end
#
#   def self.close
#     mutate.visible false
#   end
#
#   def gotoslug slug, sectionname, pageid
#
#     # NavigationStore.mutate.slug ""
#     pagetogo = AppStore.section_stores[sectionname].pages[pageid]
#     # AppStore.section_stores[sectionname].set_current_page pagetogo
#
#     params.history.push "/#{AppStore.version}/#{sectionname}/#{pagetogo[:name]}/#{slug}"
#     # NavigationStore.mutate.accordionindex pageid
#     # NavigationStore.mutate.slug slug
#     SearchResultModal.close
#
#   end
#
#   render do
#
#     Sem.Modal(size: :large, open: (state.visible ? true : false)) do
#       Sem.ModalHeader {"Search Results: "}
#       Sem.ModalContent(image: true, scrolling: true) do
#         Sem.Image(size: 'massive', src: 'dist/images/hyperloop-logo-title.png', wrapped: true) {}
#         Sem.ModalDescription() do
#
#           HEADER() {"RESULTS LISTING"}
#
#
#           # if (SearchEngineStore.inputvaluetoosmall)
#           #   P() {
#
#           #       "Input value to short, must be > 4 chars"
#
#           #     }
#
#           # else
#
#           #     P() { SearchEngineStore.inputvalue }
#           #     DIV() do
#
#           #       if (SearchEngineStore.all_results.empty?)
#
#           #         H2() {"No Result"}
#
#           #       else
#
#           #         SearchEngineStore.all_results.each_with_index do |result, index|
#
#           #           H2() {"Result #{index}: #{result[:headingslug]}"}
#           #           .on(:click) { gotoslug(result[:headingslug], result[:sectionname], result[:pageid]) }
#
#           #         end
#
#           #       end
#
#           #     end
#
#           # end
#
#         end
#       end
#       Sem.ModalActions do
#         Sem.Button(negative: true) {"Close"}.on(:click) {SearchResultModal.close}
#
#       end
#     end
#
#
#
#
#   end
#
#
# end
