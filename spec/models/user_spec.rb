require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe User do

 before(:each) do
   @valid_attributes = {
     :username  => 'Sally',
     :password => 'my_password',
     :password_confirmation => 'my_password',
     :email => 'example@example.com'
   }
 end

  describe "In general should" do

   it "should create a new instance given valid attributes" do
     User.create!(@valid_attributes)
   end

   it "should not create a new instance if any required attribute is blank" do
     for attrib in [:username, :password, :email] do
       user = User.new(@valid_attributes.reject {|k,v| k == attrib})
       user.valid?.should_not be_true
     end
   end
  end

  describe "using factory created user" do

    it "should succeed in creating a user from a factory" do
      testuser = Factory.create(:user)
      testuser.should be_valid
    end

   it "should create invalid user from factory" do
     user  = Factory.build(:invalid_user)
     user.should be_invalid
   end
  end
end