class DestinationsController < ApplicationController
  
  # get '/destinations/show' do 
  #   @destination = Destination.all 
  #     erb '/destinations/show'
  #   end
    
   
  get '/destinations/new' do 
    erb :'/destinations/new'
  end
  
  post '/destinations/new' do
    if logged_in?
      @destinations = Destination.all 
      erb :'/destinations/new'
    else 
       redirect to '/destinations/show'
     end
  end
  
  
  get '/destinations/show' do
    @destinations = Destination.find_by(params[:id])
    erb :'/destinations/show'
  end
  
  post '/destinations/show' do 
    @destinations = Destination.all
  
    erb :'/destinations/show'
  end
end