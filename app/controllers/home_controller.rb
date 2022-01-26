class HomeController < ApplicationController
  layout "home"
  def index
    session[:user_uuid] ||= SecureRandom.uuid
  end

  def show
  end
end