class UsersController < ApplicationController 
  
  
  get '/login' do 
    erb :login
  end
  
  post '/login' do 
    @user = User.find_by(:username => params[:username])
    if @user != nil && @user.password == params[:password]
      session[:user_id] = @user.id
      redirect to "/destinations/show"
  
    end
  end
  
  
  get '/edit' do
    @user = User.find_by_id(params[:id])
    erb :edit
  end  

 
  get "/home" do 
    erb :home 
  end
  
  get "/new" do 
    erb :new
  end

    
end
