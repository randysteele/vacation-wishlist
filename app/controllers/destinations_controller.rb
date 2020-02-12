class DestinationsController < ApplicationController
  
  get '/destinations' do 
    @destination = Destination.all 
      erb '/destinations/index'
    end
    
   
  get '/destinations/new' do 
   redirect_if_not_logged_in
    erb :'/destinations/new'
  end

  post '/destinations/' do
    redirect_if_not_logged_in
    if params[:city] != ""
      @destinations = Destination.create(:city => params[:city], :user_id => current_user.id, :state => params[:state], :distance => params[:distance])
      flash[:message] = "Congrats! You've Successfully Created A New Destination!" if @destinations.id
      redirect "/destinations/#{@destinations.id}"
    else 
      flash[:message] = "Sorry, that didn't work! All fields are required!"
       redirect'/destinations/new'
 end
end

  get '/destinations/:id' do
    set_destination
    erb :'/destinations/show'
  end
  
   get '/journal_entries/:id/edit' do
     redirect_if_not_logged_in
     set_destination
     if authorized_to_edit?(@destinations)
       erb :'destinations/edit'
     else
       redirect "users/#{current_user.id}"
     end
   end

  patch '/destinations/:id' do 
    redirect_if_not_logged_in
   set_destination
   if @destination.user == current_user && params[:city] !+ ""
     @destination.update(:city => params[:city])
     redirect "destinations/#{destinations.id}"
   else
     redirect "users/#{current_user.id}"
   end
 end
  
  
  delete '/destinations/:id' do 
    set_destination
    if authorized_to_edit?(@destinations)
      @destinations.destroy
      flash[:message] "Successfully deleted the selected destination"
      redirect '/destinations'
      else
        redirect
  
  
  
  
  
  
  
  
  private
  
   def set_destination
    @destination = Destination.find(params[:id)
  end
end
