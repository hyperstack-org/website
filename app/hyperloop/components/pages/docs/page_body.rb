require 'helpers/is_edge'

class PageBody < Hyperloop::Component

  param :section_name
  param page_name: ''
  param page_anchor: ''

  before_mount do
    mutate.needs_refresh false
  end

  after_mount do
    navigate_to_slug
  end

  after_update do
    navigate_to_slug
    # convert_runable_code_blocks
  end

  render(DIV) do
    Sem.Segment(class: 'page-container') do
      if SiteStore.section_stores[params.section_name].loaded?
        if is_edge?
          Sem.Label(color: 'red', ribbon: :right, size: :large) { 'edge' }
        else
          Sem.Label(color: 'blue', ribbon: :right, size: :large) { 'master' }
        end

        edit_button if SiteStore.section_stores[params.section_name].current_page[:allow_edit]

        if params.page_name.empty?
          page = SiteStore.section_stores[params.section_name].pages.first
        else
          page = SiteStore.section_stores[params.section_name].pages.select {|p| p[:name] == params.page_name }.first
        end

        html = page[:html].to_s

        DIV(class: 'pagebody', dangerously_set_inner_HTML: { __html: html } )
      end
    end
  end

  def navigate_to_slug
    puts "navigate to slug"
    unless params.page_anchor.empty?
      element = Element["#{params.page_anchor}"]
      if element.offset()
        anchorchapter_position = element.offset().top
        if @current_page_section == "#{params.section_name}-#{params.page_name}"
          Element['html, pagebody'].animate({
                scrollTop: anchorchapter_position
              }, 0)
        else
          Element['html, body'].scrollTop(anchorchapter_position);
        end
        @current_page_section = "#{params.section_name}-#{params.page_name}"
      end
    end
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
    button = DIV(class: 'improve-page-container') do
      if state.needs_refresh
        Sem.Message(positive: true) {
          Sem.MessageHeader { "Thank you! Your edits are on edge." }
          P { "Github can take up to 5 mins to refresh, you will need to reload this page." }
        }
      else
        Sem.Button(icon: :github, circular: true, label: "Improve this page") {

        }.on(:click) do
          mutate.needs_refresh true
          `window.open(#{SiteStore.section_stores[params.section_name].current_page[:edit_url]}, "_blank");`
        end
      end
    end.as_node

    Sem.Popup(trigger: button.to_n, content: 'Click to submit a PR against edge. Your contribution is most welcome.')
  end

end
