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
  
  # get "/index" do 
  #   erb :index
  # end
  
  
  
  # post '/login' do
  #   @destination = Destination.all 
  #   erb :login
  #   redirect '/create_destination'
  # end
  
   helpers do

    def logged_in?
      !!current_user
    end
  
   def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
 end
 
# get "/signup" do 
#     erb :signup
#   end
  
#   post "/signup" do
#     @user = params[:username] == "" || params[:password] == ""
#       # redirect '/failure'
    
#       User.create(username: params[:username], password: params[:password])
#       redirect '/login'
#     end
    
#     get '/users/:id' do
#     if !logged_in?
#       redirect '/destinations'
#     end
#   end  
  
 

end
