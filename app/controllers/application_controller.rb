require './config/environment'

class ApplicationController < Sinatra::Base
  
 configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :session_secret, "vacation_secret"
    enable :sessions 
  end

  get "/" do
    redirect_if_logged_in
    erb :index
  end
  
  
   helpers do

    def logged_in?
      !!current_user
    end
  
   def current_user
      @current_user ||= User.find_by(id: session[:user_id]) 
    end
 end
 
 def authorized_to_edit?(destination)
   destination.user == current_user
 end
end
