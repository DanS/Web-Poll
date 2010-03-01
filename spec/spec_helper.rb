ENV["RAILS_ENV"] ||= 'test'
require File.dirname(__FILE__) + "/../config/environment" unless defined?(RAILS_ROOT)
require 'spec/autorun'
require 'spec/rails'
require 'factory_girl'
require 'authlogic/test_case'
include Authlogic::TestCase


Spec::Runner.configure do |config|
  config.use_transactional_fixtures = true
  config.use_instantiated_fixtures  = false
  config.fixture_path = RAILS_ROOT + '/spec/fixtures/'
end


### helpers for Authlogic from http://iain.nl/2008/11/authlogic-is-awesome/
#def current_user(stubs = {})
#  @current_user ||= mock_model(User, stubs)
#end
#
#def user_session(stubs = {}, user_stubs = {})
#  @current_user ||= mock_model(UserSession, {:user => current_user(user_stubs)}.merge(stubs))
#end
#
#def login(session_stubs = {}, user_stubs = {})
#  UserSession.stub!(:find).and_return(user_session(session_stubs, user_stubs))
#end
#
#def logout
#  @user_session = nil
#end