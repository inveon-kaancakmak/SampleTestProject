Feature: Login to the website successfully

  @log_out
  Scenario: User logins to the app successfully
    Given I navigate to homepage
    When I hovered on Person Icon and navigated to Login Page
    Then I should be redirected to the Login Page
    And I login to the website with following credentials
    |kaan.cakmak@inveon.com|Test1234|
    Then I should see I logined successfully