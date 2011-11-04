class SessionsController < ApplicationController
  def new
  end

  def create 
    # debugger
    user = User.authenticate(params[:session][:email], params[:session][:password])
      if user.nil? 
        flash.now[:error] = "Invalid email/password combination." 
        # flash an error and go back to 'new' which allows user to sign in again
        render 'new'
      else
        # sing in the user and take him/her to the grid
        sign_in user
        redirect_to users_path
      end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

end
