class ApplicationController < ActionController::Base

  before_action :redirect_to_https
  before_action :redirect_from_www

  def redirect_to_https
    redirect_to protocol: 'https://' unless request.ssl? || request.local?
  end

  def redirect_from_www
    redirect_to 'https://hyperstack.org' + request.fullpath, status: 301 if request.host == 'www.hyperstack.org'
  end
end
