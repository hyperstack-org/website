# https://www.npmjs.com/package/marked#block-level-renderer-methods

class MdConverter
  def initialize md, sectionname, sectionid, pageid, pagename
    @md = md.gsub 'ruby runable', 'ruby-runable' #the space messes up the parsing
    @sectionname = sectionname
    @sectionid = sectionid
    @pageid = pageid
    @pagename = pagename
    @headings = []
    @paragraphs = []
    @code_blocks = []

    @headings_index = 0

    process
  end

  def html
    @html
  end

  def code_blocks
    @code_blocks
  end

  def headings
    @headings
  end

  def process
    `var renderer = new Marked.Renderer()`
    `renderer.heading = #{lambda {|text, level| on_heading(text, level)} }`
    `renderer.paragraph = #{lambda {|text| on_paragraph(text)} }`
    `renderer.code = #{lambda {|code, lang| on_code(code, lang)} }`
    `renderer.codespan = #{lambda {|code| on_codespan(code)} }`
    `renderer.blockquote = #{lambda {|quote| on_blockquote(quote)} }`
    `renderer.table = #{lambda {|header, body| on_table(header, body)} }`
    `renderer.list = #{lambda {|body, ordered| on_list(body, ordered)} }`

    `Marked.setOptions({ renderer: renderer })`
    @html = `Marked(#{@md})`
  end

  def on_table header, body
    return_html = "<table class='ui celled table'><thead class>#{header}</thead><tbody class>#{body}</tbody></table>"
    @headings[@headings_index-1][:paragraphs] << return_html
    return_html
  end

  def on_code code, lang
    cb = {}
    cb[:html] = highlight code, lang
    cb[:code] = code
    cb[:lang] = lang
    @code_blocks << cb

    return_html = "<pre class='pre-md-code'><code class='lang-#{lang} hljs'>#{ cb[:html] }</code></pre>"

    # if (lang == 'ruby-runable')
    #   return_html = "<div class='ui inverted instructive segment runablecode-container'><div class='ui attached top label'><span class='title'>Hyperloop Code</span><em>Live executed code</em></div>#{return_html}</div>"
    # end

    @headings[@headings_index-1][:paragraphs] << return_html
    return_html
  end

  def on_codespan code
    "<code class='inline-codespan'>#{ code }</code>"
  end

  def highlight code, lang=nil
    `hljs.highlightAuto(#{code}).value`
  end

  def on_blockquote quote
    "<div class='ui cards'><div class='ui card fluid'><div class='content'>#{quote}</div></div></div>"
  end

  def on_heading text, level
    heading = {}
    heading[:id] = "#{@sectionid}-#{@pageid}-#{@headings_index}"
    heading[:sectionname] = @sectionname
    heading[:pageid] = @pageid
    heading[:pagename] = @pagename
    heading[:text] = text
    heading[:level] = level
    heading[:slug] = text.downcase.gsub(/[^\w]+/, '-')
    heading[:slug] = heading[:slug].chop if heading[:slug].end_with?('-')
    heading[:paragraphs] = []
    @headings << heading
    @headings_index += 1

    levelicon = ['', 'bookmark outline', 'circle outline', 'square outline']
    leveliconhtml = "<i class='#{levelicon[level-1]} icon'></i>&nbsp;"
    leveliconhtml = "" if level==1

    %Q(<div class='scrollto-div' id='#{heading[:slug]}'></div>
       <p class='ptopmargin-#{level}'></p>
       <h#{level} class='doc_h#{level} chapteranchor''>
       #{leveliconhtml}#{text}</h#{level}>
      )
  end

  def on_paragraph text
    return_html = "<p>#{text}</p>"
    @headings[@headings_index-1][:paragraphs] << return_html
    return_html
  end

  def on_list body, ordered
    return_html = "<ul>#{body}</ul>"
    @headings[@headings_index-1][:paragraphs] << return_html
    return_html
  end

end
