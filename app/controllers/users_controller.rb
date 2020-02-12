class UsersController < ApplicationController 
  
  get '/login' do 
    erb :login
  end
  
  
  post '/login' do 
    @user = User.find_by(:email => params[:email])
    if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id   
    flash[:message] = "Welcome, #{@user.name}!"
    redirect "users/#{@user.id}"
  else
    redirect '/login/'
  end
end

get '/signup' do
    redirect_if_logged_in
    erb :signup
  end

   post '/users' do 
     @user = User.new(params)
     if @user.save 
       session[:user_id] = @user.id
   flash[:message] = "You have successfully created an account, #{@user.name}! Welcome!"
      redirect "/users/#{@user.id}"
    else
      flash[:errors] = "Account creation failure: #{@user.errors.full_messages.to_sentence}"
      redirect '/signup'
  end
end 
  
  get '/users/:id' do
    @user = User.find_by(id: params[:id])
    redirect_if_not_logged_in
    erb :'/users/show'
   end
  end

 
   get '/logout' do
    if logged_in?
      session.clear
      redirect '/'
    end
end