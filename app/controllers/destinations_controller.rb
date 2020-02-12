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
    if params[:city] != ""
      @destinations = Destination.create(:city params[:city], :user_id current_user.id, :state params[:state], :distance params[:distance])
      flash[:message] = "Congrats! You've Successfully Created A New Destination!" if @destinations.id
      redirect "/destinations/#{@destinations.id}"
    else 
      flash[:message] "Sorry, that didn't work! All fields are required!"
       redirect'/destinations/new'
end


  get "/destinations/show" do
     @destinations = Destination.all
    # @destinations = Destination.find_by(params[:id])
    erb :'/destinations/show'
  end

  post "/destinations/:id" do 
   set_destinations
   erb :'/destinations/show'
  end
end
