Feature: User Account

  Scenario: Signing up
    When I create the following user:
      | Name     | Alex      |
      | Password | something |
    Then I should have the following user:
      | user_name | user_password |
      | Alex      | something     |

  Scenario: Signing up failed
    When I create the following user:
      | Name     |           |
      | Password | something |
    Then I should have the following error :
    When I create the following user:
      | Name     | something |
      | Password |           |
    Then I should have the following error :

  Scenario: Logging in
    Given I am on the login page
    When I fill in "user_name" with "<Name>"
    And I fill in "user_password" with "<Password>"
    And I press "Log in"
    Then I should see "<action>"

    Examples: 
      | Name    | Password  | action                         |
      | Alex    | something | see "Signed in successfully"   |
      | ka@afdk | asfag34   | see "Invalid name or password" |

  Scenario: Logging out
    Given I am logged in
    When I click the log out link
    Then I should see "Logged out successfully!"

  Scenario: Adding/updating phone number
    Given I am logged in
    When I fill in the "user_number" with "<number>"
    And I press "Update"
    Then I should see "<action>"

    Examples: 
      | Number     | action                    |
      | 3034567891 | see "Updated successfully |
      | 303sfj4643 | see "Invalid number"      |

  Scenario: Adding/updating name
    Given I am logged in
    When I fill in the "user_name" with "<name>"
    And I press "Update"
    Then I should see "<action>"

    Examples: 
      | Name  | action                    |
      | Alexa | see "Updated successfully |
      | Al3x4 | see "Invalid name"        |

  Scenario: Seeing pin history
    Given I am logged in
    When I click on pin history
    Then I am redirected to "user_pinhistory" page
    And all pins I interacted with are displayed

  Scenario: Adding pin
    Given I am logged in
    Given I have a "user_name"
    Given I have a "user_number"
    When I press "Add Found Animal" or "Add Lost Animal"
    Then my "user_name" and "user_number" are automatically filled into the information box for a pin
