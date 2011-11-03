class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:session][:email], params[:session][:password])
      if user.nil? 
        flash.now[:error] = "Invalid email/password combination." 
        # flash an error and go back to 'new' which allows user to sign in again
        render 'new'
      else
        # sing in the user and take him/her to the 'show' page
        sign_in user
        redirect_to user
      end
  end

  def destroy
  end

end
