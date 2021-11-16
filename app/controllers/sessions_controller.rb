class SessionsController < ApplicationController
  
  def new
  end

  def create
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      # success logic, log them in
      session[:user_id] = user.id
      redirect_to '/'
    else
      # failure, render login form
      redirect_to '/login'
    end
    
    # user = User.find_by_email(params[:email])
    # #if the user exists and the password entered is correct
    # if user && user.authenticate(params[:password])
    #   #save the user id inside the browser cookie. This is how we keep the user logged in 
    #   session[:user_id] = user.id
    #   redirect_to '/'
    # else 
    #   #if the user login doesnt work send them back to login
    #   redirect_to 'login'
    # end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
