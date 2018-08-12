class ApplicationController < ActionController::Base
  before_action :redirect_from_www

  def redirect_from_www
    redirect_to 'https://hyperstack.org' + request.fullpath, status: 301 if request.host == 'www.hyperstack.org'
  end

end
