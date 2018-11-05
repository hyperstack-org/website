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
      SPAN { @text.to_s }.on(:click) do
        AppStore.history.push @path
      end
    end
  end

  def update_store
    TocStore.visible_id = @id if @classes.include?('doc_h2')
  end

end
