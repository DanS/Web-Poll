When /^they click the 'Create a New Poll' link$/ do
  click_link('Create a New Poll')
end

Then /^they should go to the new poll page$/ do
  assert_response :success
  response.should contain('New poll')
end

Then /^they should be able to create a new poll$/ do
  fill_in 'Name', :with => 'new poll name'
  click_button 'Create'
end

Then /^a poll named "([^\"]*)" appears on the list on their homepage$/ do |poll_name|
  assert_response :ok
  response.should contain('Your polls')
  response.should contain(poll_name)
end