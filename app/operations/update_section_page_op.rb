class UpdateSectionpageOp < Hyperloop::Operation

  param :section
  param :page

  step do
    SiteStore.sections[params.section].set_current_page params.page
  end

end