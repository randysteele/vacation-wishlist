require './config/environment'

class ApplicationController < Sinatra::Base
  
 configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :session_secret, "vacation_secret"
    enable :sessions 
    register Sinatra::Flash
    set :method_override, true
  end
  
  helpers do 

  get '/' do
    redirect_if_logged_in
    erb :index
  end

    def logged_in?
      !!current_user
    end
  
   def current_user
      @current_user ||= User.find_by(id: session[:user_id]) 
    end
 end
 
    def authorized_to_edit?(destinations)
      destinations.user == current_user
    end
 
     def redirect_if_not_logged_in
      if !logged_in?
        flash[:errors] = "You must be logged in to view the page you tried to view."
        redirect '/'
      end
    end
    
  def redirect_if_logged_in
      if logged_in?
       # redirect "/users/#{current_user.id}"
       redirect "/users/#{current_user.id}" 
      end
    end
end
