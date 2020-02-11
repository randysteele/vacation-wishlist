class UsersController < ApplicationController 
  
  get '/login' do 
    erb :login
  end
  
  
  post '/login' do 
    binding.pry
    @user = User.find_by(:email => params[:email])
    if @user.authenticate(params[:password])
    session[:user_id] = @user.id    
    
    else   
      
      
  end
end
  
  
  get '/signup' do 
    erb :signup
  end
  
  # post '/login' do 
  #   user = User.find_by(:email => params[:username])
  #   if user && user.authenticate(params[:password])
  #     session[:user_id] = user.id
  #     redirect to "/destinations/show"
  #   else
  #     # redirect to '/signup'
  #   end
  # end
  
  
  get '/edit' do
    @user = User.find_by_id(params[:id])
    erb :edit
  end  

 
   get '/logout' do
    if logged_in?
      session.destroy
      redirect to '/login'
    else
      redirect to '/'
    end
  end

    
end
