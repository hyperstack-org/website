class DocHeading < HyperComponent

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
      SPAN { @Text.to_s }.on(:click) do
        AppStore.history.push @Path
      end
    end
  end

  def update_store
    TocStore.visible_id = @Id if @Classes.include?('doc_h2')
  end

end
