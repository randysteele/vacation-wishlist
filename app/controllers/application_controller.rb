require './config/environment'

class ApplicationController < Sinatra::Base
  
 configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :session_secret, "vacation_secret"
    enable :sessions 
  end

  get "/" do
    erb :index
  end
  
  get '/signup' do 
    erb :signup
  end
  
  post '/signup' do
    if params[:username] == "" || params[:password] == ""
      redirect '/failure'
    else
      User.create(username: params[:username], password: params[:password])
      redirect '/destinations/new'
    end
end
  
   helpers do

    def logged_in?
      !!current_user
    end
  
   def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
 end
end
