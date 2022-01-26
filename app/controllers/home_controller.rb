class HomeController < ApplicationController
  layout "home"
  def index
    session[:test_cookie] ||= SecureRandom.uuid
    p session[:test_cookie]
  end
end