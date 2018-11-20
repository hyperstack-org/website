
require 'helpers/helpers'

class PageBody < HyperComponent

  param :section_name
  param page_name: ''
  param page_anchor: ''

  before_mount do
    @needs_refresh = false
  end

  # after_mount do
  #   create_doc_headings
  # end

  after_update do
    navigate_to_slug
    create_doc_headings
  end


  render(DIV) do
    DIV(id: 'very-top-of-page-body') { }
    Sem.Segment(class: 'page-container') do
      if AppStore.section_stores[@SectionName].loaded? && AppStore.section_stores[@SectionName].pages.any?

        if @PageName.empty?
          @page = AppStore.section_stores[@SectionName].pages.first
        else
          @page = AppStore.section_stores[@SectionName].pages.select {|p| p[:name] == @PageName }.first
        end

        edit_button(@page) if @page[:allow_edit]

        if is_edge?
          Sem.Label(color: 'red', ribbon: :right, size: :large) { "#{AppStore.version}" }
        else
          Sem.Label(color: 'blue', ribbon: :right, size: :large) { "#{AppStore.version}" }
        end

        html = @page[:html].to_s
        DIV(class: 'pagebody', id: 'page-body', dangerously_set_inner_HTML: { __html: html } )
      end
    end
  end

  def navigate_to_slug
    if @PageAnchor.empty?
      # this is a new page
      slug = 'very-top-of-page-body'
    else
      # scrolling on the same page
      slug = @PageAnchor
      slug = slug.tr('#','')
    end

    element = `document.getElementById(slug)`
    `element.scrollIntoView();` if element
    `window.scrollBy(0, -500);` # to accomidate topbar
  end

  # def convert_runable_code_blocks
  #   raise 'convert_runable_code_blocks not working'
  #   Element.find('code.lang-ruby-runable').each do |mount_point|
  #     code = mount_point.text
  #     element = ReactAPI.create_element(CodeMirror, { code: code } )
  #     ReactAPI.render(element, mount_point.parent)
  #    end
  # end

  def create_doc_headings
    ::Element.find('.scrollto-div').each do |mount_point|
      path = "/#{AppStore.version}/docs/#{@SectionName}/#{@PageName}##{mount_point.id}"
      element = ReactAPI.create_element(DocHeading, {
        text: mount_point.text,
        path: path,
        id: mount_point.id,
        classes: mount_point.class_name
       } )
      ReactAPI.render(element, mount_point)
      # puts "class_name #{mount_point.class_name}"
    end
  end

  def edit_button(page)
    button = DIV(class: 'improve-page-container') do
      if @needs_refresh
        Sem.Message(positive: true) {
          Sem.MessageHeader { "Thank you! Your edits (or PR) are on edge." }
          if (is_edge?)
            P { "Github can take up to 5 mins to refresh their CDN, you will need to reload this page." }
          else
            P { "Your changed will appear on this site when edge is next merged to master." }
          end
        }
      else
        Sem.Button(icon: :github, circular: true, label: "Improve this page") {

        }.on(:click) do
          mutate @needs_refresh = true
          `window.open(#{page[:edit_url]}, "_blank");`
        end
      end
    end.as_node

    Sem.Popup(trigger: button.to_n, content: 'Click to submit a PR against edge. Your contribution is most welcome.')
  end
end
