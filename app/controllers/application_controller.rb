require './config/environment'

class ApplicationController < Sinatra::Base
  
 configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :session_secret, "password_security"
  end

  get "/home" do 
    erb :home 
  end
  
  get "/new" do 
    erb :new
  end

end
