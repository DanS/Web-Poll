class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new
  end

  # login
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Successfully logged in."
      redirect_to current_user
    else
      render :action => 'new'
    end
  end

  #logout
  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice] = "Successfully logged out."
    redirect_to root_path
  end

  def index
    if current_user
      redirect_to user_path(current_user)
    else
      @user_session = UserSession.new
    end
  end
end
