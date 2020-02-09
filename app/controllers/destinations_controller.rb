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
      if params[:content] == ""
        redirect to "/destinations/new"
      else
        @destinations = current_user.destination.build(content: params[:content])
        if @destinations.save
          redirect to "/destinations/#{@destinations.id}"
        else
          redirect to "/destinations/new"
        end
      end
    # else
    #   redirect to '/login'
    end
  end
  
  get '/destinations/show' do
    @destinations = Destination.all
    erb :'/destinations/show'
  end
end