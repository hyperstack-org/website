class LocalDocsController < ActionController::Base
  # this is only used when editing the docs locally to avoid the slow Github CDN
  def index
    file = params[:file]
    raise "md files only" unless file.split(//).last(2).join == 'md'
    render file: "../hyperstack/#{file}"
  end
end
