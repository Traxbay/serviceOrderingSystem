class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # login the user
      flash.now[:success] = "Welcome to Service Ordering System ! "
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_back_or root_path
      flash[:success] = "Welcome Again !"
    else
      flash.now[:danger] = "Error logging in !, invalid email/password combination"
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end


end
