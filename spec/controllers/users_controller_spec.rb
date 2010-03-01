require File.dirname(__FILE__) + '/../spec_helper'
activate_authlogic
 
describe UsersController do
  
  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end
  
  it "create action should render new template when model is invalid" do
    User.any_instance.stubs(:valid?).returns(false)
    post :create 
    response.should render_template(:new)
  end
  
  it "create action should redirect when model is valid" do
    User.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to('users/1')
  end
  
  it "edit action should render edit template" do
    get :edit, :id => User.first
    response.should render_template(:edit)
  end
  
  it "update action should render edit template when model is invalid" do
    user = Factory.create(:user)
    UserSession.create(:username => user.username, :password => 'password')
    #stub user.valid? as false only after Factory.create and UserSession.create
    #doing it before will cause those operations to fail
    User.any_instance.stubs(:valid?).returns(false)
    debugger
    put :update
    response.should render_template(:edit)
  end
  
  it "update action should redirect when model is valid" do
    pending
    User.any_instance.stubs(:valid?).returns(true)
    put :update, :id => User.first
    response.should redirect_to(root_url)
  end
end
