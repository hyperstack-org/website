class DocHeading < Hyperloop::Component
  param :history
  param :text
  param :path

  render do
    Sem.Visibility(
      onTopVisible: -> {  puts "#{params.text} - entered" }, #onOnScreen or onTopVisible
      continuous: false,
      once: false,
      fireOnMount: false,
      context: `window.document.getElementById('docs-page-content')`
    ) do
      SPAN { params.text.to_s }.on(:click) do
        params.history.push params.path
      end
    end
  end
end
