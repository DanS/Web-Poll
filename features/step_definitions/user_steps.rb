Given /^I am not already a user$/ do
end

When /^I fill out the new user form$/ do
  visit 'users/new'
  fill_in "Username", :with=>'Joe'
  fill_in "Password", :with=>'password'
  fill_in "user_password_confirmation", :with=>'password'
  fill_in "Email", :with=>'joe@example.com'
end

Then /^an account should be created$/ do
  click_button "Submit"
  assert_response :success
  response.should contain("Registration successful")
end

Given /^a user exists with name "([^\"]*)" and password "([^\"]*)"$/ do |username, password|
  User.create! :username=>username, :password=>password, :email=>'nomail@please.com',
    :password_confirmation => password
end

When /^they login as "(.+)" with a password of "(.+)"$/ do |username, password|
  visit 'login'
  fill_in 'Username', :with=>username
  fill_in 'Password', :with=>password
  click_button 'Submit'
end

Then /^my user page should be displayed$/ do
  assert_response :success
  response.should contain('Successfully logged in')
end

Then /^he should be returned to the login page with an error message displayed$/ do
  response.should contain("Password")
  response.should contain("Password is not valid")
end

