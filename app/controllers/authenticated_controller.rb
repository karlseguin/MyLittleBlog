require 'digest/sha2'

class AuthenticatedController < ApplicationController
  before_filter :authenticate, :except => [:login, :do_login, :logout]
  filter_parameter_logging :password
  
  def login
  end
  
  def do_login
    if params[:username].downcase != Configuration.admin_username || Digest::SHA512.hexdigest(params[:password]) != Configuration.admin_password
      redirect_to :action => 'login' and return
    end
    session[:user] = params[:username]
    redirect_to :action => 'index'
  end
  
  def logout
    session[:user] = nil
    redirect_to :controller => 'home', :action => 'index'
  end
  
  private
    def authenticate
      if !is_logged_in?
        redirect_to :controller => 'adnim', :action => 'login'
      end
    end
end