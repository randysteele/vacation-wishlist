class DestinationsController < ApplicationController
  
  get '/destinations' do 
    @destination = Destination.all 
      erb '/destinations/index'
    end
    
   
  get '/destinations/new' do 
   redirect_if_not_logged_in
    erb :'/destinations/new'
  end


  get '/destinations/show' do
    # binding.pry
    set_destination
    erb :'/destinations/show'
  end
  
   get '/destinations/:id/edit' do
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
   if @destinations.user == current_user && params[:city] != ""
     @destinations.update(city: params[:city])
     redirect "/destinations/# {destinations.id}"
   else
     redirect "users/#{current_user.id}"
   end
 end
  
  
  delete '/destinations/:id' do 
    set_destination
    if authorized_to_edit?(@destinations)
      @destinations.destroy
      flash[:message] = "Successfully deleted the selected destination"
      redirect '/destinations'
      else
        redirect '/destinations'
      end
      
    end
    
    post '/destinations/new' do
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
  
   def set_destination
    @destination = Destination.find_by_id(params[:id])
  end
end
