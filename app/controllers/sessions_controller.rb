class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    #if the user exists and the password entered is correct
    if user && user.authenticate(params[:password])
      #save the user id inside the browser cookie. This is how we keep the user logged in 
      session[:user_id] = user.id
      redirect_to '/'
    else 
      #if the user login doesnt work send them back to login
      redirect_to 'login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
