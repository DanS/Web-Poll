require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

#describe AdminController do
#  before(:each) do
#    salt = User.create_new_salt
#    encrypted_password = User.encrypted_password('mypassword', salt)
#    @ralph = User.create(:name=>'Ralph', :hashed_password=>encrypted_password,
#        :email=>'ralph@pmail.com')
#  end
#
#  def do_post(parameters)
#    post(parameters)
#  end
#
#  describe "should allow a known user to login" do
#    do_post(:login, :name=>'Ralph', :password => 'mypassword')
#    #response.should_redirect_to :action => "index"
#    session[:user_id].should == ralph.id
#  end
#end

#test "login" do
#    ralph = users(:Ralph)
#    post :login, :name => ralph.name, :password => 'mypassword'
#    #assert_redirected_to :action => "index"
#    assert_equal ralph.id, session[:user_id], 'User.id did not match session[user_id]'
#  end
