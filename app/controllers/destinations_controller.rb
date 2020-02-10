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
  
  
  get '/destinations/:id' do 
    if logged_in?
      @destinations = Destination.find_by_id(params[:id])
      erb :'/destinations/show'
    else 
      # redirect to '/destinations/show'
    end
  end
  
  
  get '/destinations/:show' do
    if logged_in?
      @destinations = Destination.find_by_id(params[:id])
      erb :'/destinations/show'
  end
 end
 
  post '/destinations/:show' do 
    @destinations = Destination.all
    erb :'/destinations/show'
  end
  
  patch '/destinatinos/show' do 
    if logged_in?
      if params [:city] == ""
        redirect to "/destinations/#{params[:id]}/edit"
  #     else 
  #       @destinations = Destination.find_by_id(params[:id])
  #       if @destinations.update(city: parmas[:city])
  #         redirect to '/destinations/#{@destinations.id}/edit'
         end
  #     elsif 
  #       redirect to '/destinations/show'
       end
     end
  # elsif
  #   redirect to '/login'

end