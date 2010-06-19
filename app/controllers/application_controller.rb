class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery
  
  public
    def is_logged_in?
      !session[:user].nil?
    end
end

