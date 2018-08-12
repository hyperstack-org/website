class ApplicationController < ActionController::Base
  before_action :redirect_from_www

  def redirect_from_www
    redirect_to request.original_url.gsub(/\A(?<scheme>http(?:s):\/\/)?(www\.)(?<url>.*)/,'{\k<scheme>\k<url>}'), status: 301 if request.host[/\Awww\./]
  end

end
