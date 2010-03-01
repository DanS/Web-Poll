class UsersController < ApplicationController
  # GET /users
  # GET /users.xml
  #  def index
  #    @users = User.all
  #
  #    respond_to do |format|
  #      format.html # index.html.erb
  #      format.xml  { render :xml => @users }
  #    end
  #  end

  # GET /users/1
  def show
    @user = current_user
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = current_user
  end

  # POST /users
  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Registration successful"
      redirect_to @user
    else
      render :action => "new"
    end
  end

  # PUT /users/1
  def update
    debugger
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = 'User was successfully updated.'
      redirect_to(@user)
    else
      flash[:notice]
      render :action => "edit"
    end
  end

  # DELETE /users/1
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to(users_url)
  end
end
