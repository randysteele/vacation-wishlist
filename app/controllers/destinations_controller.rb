class DestinationsController < ApplicationController
  
  # get '/destinations/show' do 
  #   @destination = Destination.all 
  #     erb '/destinations/show'
  #   end
    
   
  get '/destinations/new' do 
    erb :'/destinations/new'
  end

  post '/destinations/new' do
      @destinations = Destinations.all 
       erb :'/destinations/new'
end


  get "/destinations/show" do
     @destinations = Destination.all
    # @destinations = Destination.find_by(params[:id])
    erb :'/destinations/show'
  end

  post "/destinations/show" do 
   @city = params[:city] 
   @state = params[:state]
   @distance = params[:distance]
   erb :'/destinations/show'
  end
end
