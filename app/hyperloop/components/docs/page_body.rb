
require 'helpers/helpers'

class PageBody < Hyperloop::Component

  param :section_name
  param page_name: ''
  param page_anchor: ''

  before_mount do
    mutate.needs_refresh false
    @element_anchors_created = {}
  end

  after_mount do
    create_doc_headings unless @doc_headings_done
  end

  after_update do
    navigate_to_slug
  end

  render(DIV) do
    DIV(id: 'very-top-of-page-body') { }
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
    if params.page_anchor.empty?
      # this is a new page
      slug = 'very-top-of-page-body'
    else
      # scrolling on the same page
      slug = params.page_anchor
      slug = slug.tr('#','')
    end

    element = `document.getElementById(slug)`
    `element.scrollIntoView();` if element

    #  this is used to accomidate the topbar
    `window.scrollBy(0, -500);`
  end

  # def convert_runable_code_blocks
  #   raise 'convert_runable_code_blocks not working'
  #   Element.find('code.lang-ruby-runable').each do |mount_point|
  #     code = mount_point.text
  #     element = React.create_element(CodeMirror, { code: code } )
  #     React.render(element, mount_point.parent)
  #    end
  # end

  def create_doc_headings
    @doc_headings_done = true
    puts "create_doc_headings"
    Element.find('.scrollto-div').each do |mount_point|
      puts "found #{mount_point.id}"
      React.create_element(DocHeading, { id: mount_point.id } )
      # React.render(element, mount_point)
     end
  end

  # def create_doc_headings
  #   puts "create_doc_headings"
  #   doc_heading = Module.const_get('DocHeading')
  #   `var x = document.getElementsByClassName("scrollto-div");
  #     var i;
  #     for (i = 0; i < x.length; i++) {
  #         console.log(x.length);
  #         ReactDOM.render(React.createElement(#{doc_heading}, {id: x[i].id}, null),
  #           document.getElementById(x[i].id));
  #   };`
  # end


  # def create_doc_headings
  #   puts "create_doc_headings"
  #   `var x = document.getElementsByClassName("scrollto-div");
  #     var i;
  #     for (i = 0; i < x.length; i++) {
  #         ReactDOM.render(React.createElement('DocHeading', {id: x[i].id}, null),
  #           document.getElementById(x[i].id));
  #   };`
  # end

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
