A logged in user
should be able to create polls

Scenario: Create a new poll
    Given a user exists with name "Joe" and password "password"
    When they login as "Joe" with a password of "password"
    And they click the 'Create a New Poll' link
    Then they should go to the new poll page
    And they should be able to create a new poll
    And a poll named "new poll name" appears on the list on their homepage