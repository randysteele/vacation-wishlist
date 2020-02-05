class UsersControlller < ApplicationController 
  
   get '/users/:id' do
    if !logged_in?
      redirect '/destinations'
    end
  end  
    
   
    
end
