class UsersController < ApplicationController 
  
  get '/login' do 
   redirect_if_logged_in
    erb :login
  end
  
  
  post '/login' do 
    @user = User.find_by(:email => params[:email])
    if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id   
    flash[:message] = "Welcome, #{@user.name}!"
    redirect "users/#{@user.id}"
  else
    flash[:errors] = "Your credentials were invalid.  Please sign up or try again."
     redirect '/login'
  end
end

 get '/signup' do
    redirect_if_logged_in
    erb :signup
  end

  
   post '/signup' do 
    
     @user = User.new(params)
     if @user.save 
       session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    else
       redirect '/signup'
  end
end 
  
  get '/users/:id' do
    @user = User.find_by(id: params[:id])
    redirect_if_not_logged_in
    erb :'/users/show'
  end
  

 
   get '/logout' do
      session.clear
      redirect '/'
    end
  
end