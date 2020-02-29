class DestinationsController < ApplicationController
  
  get '/destinations/' do 
    @destinations = Destination.all 
    logged_in?
      erb :'/destinations/index'
    end
    
    post '/destinations/' do
     redirect_if_not_logged_in
    if params[:city] != ""
     @destinations = Destination.create(:city => params[:city], :user_id => current_user.id, :state => params[:state], :distance => params[:distance])
      redirect "/destinations/#{@destinations.id}"
    else 
       redirect'/destinations/new'
 end
end


  get '/destinations/new' do 
   redirect_if_not_logged_in
    erb :'/destinations/new'
  end
  
  post '/destinations/new' do
    @destinations = Destination.create(:city => params[:city], :user_id => current_user.id, :state => params[:state], :distance => params[:distance])
    redirect :"/destinations/"
  end


  get '/destinations/:id' do
    @destinations = Destination.find_by_id(params[:id])
    erb :'/destinations/show'
  end
  
  delete '/destinations/:id' do 
    @destinations = Destination.find_by_id(params[:id])
      @destinations.destroy
      redirect '/destinations/'
      end
    
    
    patch '/destinations/:id' do 
    redirect_if_not_logged_in
   @destinations = Destination.find_by_id(params[:id])
   if @destinations.user == @current_user ||= User.find_by(id: session[:user_id])  && params[:city] != ""
      @destinations.update(:city => params[:city], :state => params[:state], :distance => params[:distance])
     redirect  :"/destinations/# {destinations.id}"
  else
    redirect '/users/#{current_user.id}'
   end
 end
    
     get '/destinations/:id/edit' do
     @destinations = Destination.find_by_id(params[:id])
     if @destinations.user == current_user && params[:city] != ""
       erb :'/destinations/edit'
     else
       redirect :"/users/#{current_user.id}"
     end
   end
end
