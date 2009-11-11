Feature: create new user account

    Anyone should be able to create an account
    use the account to login
    user pages should only be visible to logged in users

    Scenario: anyone should be able to create an account
        Given I am not already a user
        When I fill out the new user form
        Then an account should be created

    Scenario: Existing user can login
        Given a user exists with name "Joe" and password "password"
        When they login as "Joe" with a password of "password"
        Then my user page should be displayed

    Scenario: User with an account can not login with wrong password
        Given a user exists with name "Joe" and password "password"
        When they login as "Joe" with a password of "wrong"
        Then he should be returned to the login page with an error message displayed