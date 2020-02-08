class DestinationController < ApplicationController
  
  get "/destinations" do 
    @destination = Destination.all 
      erb '/destinations/show'
    end
    
    get '/create_destination' do
   if logged_in?
     erb :create_destination
  # else redirect '/login'
     end
  end 
  
  get '/destinations/new' do 
    erb :'/destination/new'
  end
  
  post '/destinations' do
    if logged_in?
      if params[:content] == ""
        redirect to "/destinations/new"
      else
        @destination = current_user.destination.build(content: params[:content])
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