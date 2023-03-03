Feature: News Section that works as an Announcement

    <!-- Happy Path -->
    Scenario: Should not be displaying an Announcement if no one report a lost or found pet on map
        Given I am on the homepage
        When no one have report a lost or found pet on map
        Then the Announcement bar should not be displaying any messages

    Scenario: Display a recently found pet in news section
        Given I am login on the homepage
        When I pin a dog that I found on a map
        Then I should see the news section displaying that "Username recently found a pet on some location"

    Scenario: Display a recently lost pet in new section
        Given I am login on the homepage
        When I pin a lost pet on a map
        Then I should see the news section displaying that "Username recently lost a pet on some location"

    <!-- This testing maybe the right case but could be wrong case depend on the client
    Scenario: Display a recently found pet in news section
        Given I am not login on the homepage
        When I pin a pet that I found on a map
        Then I should see the news section displaying "Someone recently saw a pet on some location"
    
    Scenario: Display a recently lost pet in news section
        Given I am not login on the homepage
        When I pin a lost pet on a map
        Then I should see the news section displaying "Someone recently lost a pet on some location"
    -->

    <!-- Unhappy Path -->
    Scenario: Won't Display a recently lost or found message without a location
        Given I am not login on the homepage
        When I report a lost or found pet but without a location on map
        Then the news section won't displayed that report
    
    Scenario: Won't Display a recently lost or found message without a location
        Given I am login on the homepage
        When I report a lost or found pet but without a location on map
        Then the news section won't displayed that report 
    
    Scenario: Won't dislay a recently lost or found message without login
        Given I am not login on the homepage
        When I report a lost or found pet on map
        Then will prompt me to login page in order to do so