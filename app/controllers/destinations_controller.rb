class DestinationController < ApplicationController
  
  get "/destinations" do 
    @destination = Destination.all 
      erb :create_destinations
    
    end
    
    get '/create_destination' do
   if logged_in?
     erb :create_destination
  # else redirect '/login'
     end
  end 
  
  post '/destinations' do
    if logged_in?
      if params[:content] == ""
        redirect to "/destinations/new"
      else
        @tweet = current_user.tweets.build(content: params[:content])
        if @destination.save
          redirect to "/destinations/#{@destinations.id}"
        else
          redirect to "/destinations/new"
        end
      end
    # else
    #   redirect to '/login'
    end
  end
  
 
  


end