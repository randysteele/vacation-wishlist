class DestinationController < Sinatra::Base
  
  get "/destinations" do 
    if logged_in?
      @destinations = Destination.all
      erb :destinations
    else 
      redirect to '/login'
    end
    end
    
    get '/destinations/new' do
    if logged_in?
      erb :'destinations/create_destination'
    else
      redirect to '/login'
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
    else
      redirect to '/login'
    end
  end


end