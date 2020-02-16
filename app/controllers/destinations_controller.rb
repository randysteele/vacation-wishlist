class DestinationsController < ApplicationController
  
  get '/destinations/' do 
    @destinations = Destination.all 
    logged_in?
      erb :'/destinations/index'
    end
    
    post '/destinations/' do
    # redirect_if_not_logged_in
    if params[:city] != ""
     @destinations = Destination.create(:city => params[:city], :user_id => current_user.id, :state => params[:state], :distance => params[:distance])
   # @destinations = Destination.create(city: params[:city], user_id: current_user.id, state: params[:state], distance: params[:distance]) 
      flash[:message] = "Congrats! You've Successfully Created A New Destination!" if @destinations.id
      redirect "/destinations/#{@destinations.id}"
    else 
      flash[:message] = "Sorry, that didn't work! All fields are required!"
       redirect'/destinations/new'
 end
end


  get '/destinations/new' do 
   redirect_if_not_logged_in
    erb :'/destinations/new'
  end
  
  post '/destinations/new' do
    @destinations = Destination.create(:city => params[:city], :user_id => current_user.id, :state => params[:state], :distance => params[:distance])
    redirect :"/destinations"
  end


  get '/destinations/:id' do
    @destinations = Destination.find_by_id(params[:id])
    erb :'/destinations/show'
    
  end
  
  delete '/destinations/:id' do 
    @destinations = Destination.find_by_id(params[:id])
    # if authorized_to_edit?(@destinations)
      @destinations.destroy
      flash[:message] = "Successfully deleted the selected destination"
      redirect '/destinations/'
    #  else
     #   redirect '/destinations'
     # end
    end
    
    patch '/destinations/:id' do 
    redirect_if_not_logged_in
   @destinations = Destination.find_by_id(params[:id])
   if @destinations.user == @current_user ||= User.find_by(id: session[:user_id])  && params[:city] != ""
   #   if @destinations.user == current_user && params[:city] != ""
      @destinations.update(:city => params[:city], :state => params[:state], :distance => params[:distance])
     redirect  '/destinations/#{destinations.id}'
  # else
  #   redirect '/users/#{current_user.id}'
   end
 end
    
     get '/destinations/:id/edit' do
    # redirect_if_not_logged_in
     @destinations = Destination.find_by_id(params[:id])
       erb :'/destinations/edit'
    # else
    #   redirect "/users/#{current_user.id}"
       
    # end
   end

    
  #   private 
    
  #   def set_destination
  #   @destinations = Destination.find_by_id(params[:id])
  # end
   
end
