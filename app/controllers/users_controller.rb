class UsersController < ApplicationController 
  
  
  get '/users/login' do 
    erb :'/users/login'
  end
  
  post '/users/login' do 
    @user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to "/destinations"
   else
      redirect to '/signup'
    end
  end
  
  
  
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
