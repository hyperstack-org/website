class DocHeading
  include Hyperstack::Component
  
  param :history
  param :text
  param :path
  param :id
  param :classes

  render do
    Sem.Visibility(
      onPassing: -> { update_store }, #onOnScreen or onTopVisible
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

  def update_store
    TocStore.visible_id = params.id if params.classes.include?('doc_h2')
  end

end
