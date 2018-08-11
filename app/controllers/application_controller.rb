class ApplicationController < ActionController::Base

  before_action :redirect_to_https

  def redirect_to_https
    redirect_to protocol: 'https://' unless request.ssl? || request.local?
  end
end
