
class ReactYahooSticky < Hyperloop::Component
  imports 'YahooSticky'
end

class SearchResultSidebar < Hyperloop::Component

  param :history
  param :location
  param :section

  render do
    Sem.Rail(close: true, dividing: false, position: 'left') do
      # ReactYahooSticky(enable: true, top: 50) do
        DIV(class: 'ui sticky visible transition') do
          H1(){"#{SearchEngineStore.nbresults} results found."}
          H2(){"in #{SearchEngineStore.all_results.length} chapters"}
        end
      end
    # end
  end

end
