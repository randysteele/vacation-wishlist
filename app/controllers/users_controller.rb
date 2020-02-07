class UsersController < ApplicationController 
  
  
   get '/users/signup' do 
      
    erb :'/users/signup'
  end
  
  get '/users/:id' do
    @user = User.find_by_id(params[:id])
    erb :'/users/edit'
  end  
    
   
  
  post "/signup" do
    if params[:username] == "" || params[:password] == ""
      redirect '/failure'
    else
      User.create(username: params[:username], password: params[:password])
      redirect '/login'
    end
end

  #   post "/signup" do
  # if params[:username] == "" || params[:password] == ""
  # redirect '/index'
  # end

  get "/home" do 
    erb :home 
  end
  
  get "/new" do 
    erb :new
  end

    
end
