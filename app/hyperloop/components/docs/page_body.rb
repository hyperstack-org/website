require 'helpers/helpers'

`document.addEventListener("DOMContentLoaded", function(event) {
  console.log('here now');
});`

class PageBody < Hyperloop::Component

  param :section_name
  param page_name: ''
  param page_anchor: ''

  before_mount do
    mutate.needs_refresh false
    @element_anchors_created = {}
  end

  after_mount do
    # navigate_to_slug
    # `RsScroll.scrollToTop({duration: 1});`
    # create_element_anchors
  end

  after_update do
    # navigate_to_slug
    # `RsScroll.scrollToTop({duration: 1});`
    # `window.scroll({
    #   top: 0
    # });`
    # `var d = document.getElementById("page-body");
    # d.scrollIntoView(true);`
    # convert_runable_code_blocks
    create_element_anchors
    navigate_to_slug
  end

  render(DIV) do
    Sem.Segment(class: 'page-container') do
      if AppStore.section_stores[params.section_name].loaded? && AppStore.section_stores[params.section_name].pages.any?
        # if is_edge?
          Sem.Label(color: 'red', ribbon: :right, size: :large) { "#{AppStore.version}" }
        # else
          # Sem.Label(color: 'blue', ribbon: :right, size: :large) { "#{AppStore.version}" }
        # end

        if params.page_name.empty?
          @page = AppStore.section_stores[params.section_name].pages.first
        else
          @page = AppStore.section_stores[params.section_name].pages.select {|p| p[:name] == params.page_name }.first
        end

        edit_button(@page) if @page[:allow_edit]

        html = @page[:html].to_s
        DIV(class: 'pagebody', id: 'page-body', dangerously_set_inner_HTML: { __html: html } )
      end
    end
  end

  def navigate_to_slug
    #  this works:
    # `RsScroller.scrollTo('components', {smooth: "easeInOutQuint", offset: -120})`

    if params.page_anchor.empty?
      slug = @page[:headings][0][:slug]
    else
      slug = params.page_anchor
      slug = slug.tr('#','')
    end

    puts "navigate to slug '#{slug}'"

    `RsScroller.scrollTo(slug, {smooth: "easeInOutQuint", offset: -50, isDynamic: true})`

    unless params.page_anchor.empty?
      # element = Element["#{params.page_anchor}"]
      # anchor = params.page_anchor
      # element = `document.getElementById(anchor)`
      # `element.scrollIntoView();` if element
      # if element.offset()
      #   anchorchapter_position = element.offset().top
      #   if @current_page_section == "#{params.section_name}-#{params.page_name}"
      #     Element['html, pagebody'].animate({
      #           scrollTop: anchorchapter_position
      #         }, 0)
      #   else
      #     Element['html, body'].scrollTop(anchorchapter_position);
      #   end
      #   @current_page_section = "#{params.section_name}-#{params.page_name}"
      # end
    end
  end

  def create_element_anchors
    `var x = document.getElementsByClassName("scrollto-div");
      var i;
      for (i = 0; i < x.length; i++) {
          ReactDOM.render(React.createElement(RsElement, {name: x[i].id}, null),
            document.getElementById(x[i].id))
    };`
    # RsScroller.scrollTo('stylish-components', {smooth: "easeInOutQuint", offset: -120})
    # RsScroll.scrollToTop({duration: 1});

  end

  def convert_runable_code_blocks
    raise 'convert_runable_code_blocks not working'
    Element.find('code.lang-ruby-runable').each do |mount_point|
      code = mount_point.text
      element = React.create_element(CodeMirror, { code: code } )
      React.render(element, mount_point.parent)
     end
  end

  def edit_button(page)
    button = DIV(class: 'improve-page-container') do
      if state.needs_refresh
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
          mutate.needs_refresh true
          `window.open(#{page[:edit_url]}, "_blank");`
        end
      end
    end.as_node

    Sem.Popup(trigger: button.to_n, content: 'Click to submit a PR against edge. Your contribution is most welcome.')
  end

end
