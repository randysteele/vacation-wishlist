require './config/environment'

class ApplicationController < Sinatra::Base
  
 configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :session_secret, "password_security"
  end

  get "/" do
    erb :index
  end
  
  get "/signup" do 
    erb :signup
  end
  
  # post "/signup" do
  #   if params[:username] == "" || params[:password] == ""
  #     redirect '/failure'
  #   else
  #     User.create(username: params[:username], password: params[:password])
  #     redirect '/login'
  #   end

  get "/home" do 
    erb :home 
  end
  
  get "/new" do 
    erb :new
  end

end
