class UsersController < ApplicationController 
  
  get '/login' do 
    erb :login
  end
  
  
  post '/login' do 
    @user = User.find_by(:email => params[:email])
    
    if @user.authenticate(params[:password])
      
    session[:user_id] = @user.id   
    puts session
    redirect "#{@user.id}"
  # else
  #   redirect '/login/'
  end
end

   post '/users' do 
   if params[:name] != "" && params[:email] != "" && params[:password] != ""
   @user = User.create[params]
    redirect to '/users/#{user.id}'
  # else
  #   redirect to '/error'
  end
end 
  
  get '/users/:id' do
    erb :'/users/show' 
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