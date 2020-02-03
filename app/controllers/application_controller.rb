require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end
  
  get "/home" do 
    erb :home 
  end
  
  get "/new" do 
    erb :new
  end

end
