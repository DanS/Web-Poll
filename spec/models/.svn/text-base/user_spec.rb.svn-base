require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe User do
    before(:each) do
      @valid_attributes = {
        :name => 'Sally',
        :password => 'my_password',
        :email => 'example@example.com'
      }
    end

  describe "In general should" do
    
    it "should not create a new instance if any required attribute is blank" do
      for attrib in [:name, :password, :email] do
        should be_invalid_without_attrib(User, attrib, @valid_attributes)
      end
    end
  end
  
  describe "a user without an account" do
    it "should be able to create an account" do
      lambda { User.create(@valid_attributes)
        }.should change {User.find(:all).size}.by(1)
    end
    it "should not be able to login" do
      User.authenticate('no-name', 'no-password').should be_nil
    end
  end
  
  describe "a user with an account" do
    before(:each) do
     User.create!(:name=>'joe', :password=>'password', :email=>'joe@blow.com')
    end

    it "should authenitcate" do
      User.authenticate('joe', 'password').should_not be_nil
    end
  end

end
