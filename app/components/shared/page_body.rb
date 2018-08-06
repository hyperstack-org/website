class PageBody < Hyperloop::Component

  param :section

  before_mount do
    mutate.needs_refresh false
  end

  after_update do
    unless NavigationStore.slug.empty?
      element = Element["##{NavigationStore.slug}"]
      if element.offset()
        anchorchapter_position = element.offset().top
        Element['html, body'].animate({
              scrollTop: anchorchapter_position
            }, 500)
      end
    end
    # convert_runable_code_blocks
  end

  render do
    puts "page body render #{params.section}"
    DIV(class: 'page-container') do
      if SiteStore.sections[params.section].loaded?
        set_pagebody_cssstyle
        edit_button if SiteStore.sections[params.section].current_page[:allow_edit]
        html = SiteStore.sections[params.section].current_page[:html].to_s
        DIV(class: 'pagebody', dangerously_set_inner_HTML: { __html: html } )
      end
    end
  end

  def set_pagebody_cssstyle

    #Element['.ptopmargin-2'].prev('h1').css('height', '0em')
    # Element['h3'].prev().not('h2').css('margin-bottom', '5em')
    # Element['h4'].prev().css('margin-bottom', '5em')
    # Element['h2'].before( "<p>Test</p>" )
  end

  def convert_runable_code_blocks
    raise 'convert_runable_code_blocks not working'
    Element.find('code.lang-ruby-runable').each do |mount_point|
      code = mount_point.text
      element = React.create_element(CodeMirror, { code: code } )
      React.render(element, mount_point.parent)
     end
  end

  def edit_button
    DIV(class: 'edit-github-button') do
      if state.needs_refresh
        Sem.Message(positive: true) {
          Sem.MessageHeader { "Refresh for changes" }
          P { "Note: There can be a delay with Github pages" }
        }
      else
        Sem.Button(icon: :github, circular: true, label: "Improve this page") {

        }.on(:click) do
          mutate.needs_refresh true
          `window.open(#{SiteStore.sections[params.section].current_page[:edit_url]}, "_blank");`
        end
      end
    end
  end

end
