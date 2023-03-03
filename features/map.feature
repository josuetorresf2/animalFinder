Feature: Map API

    Scenario: Seeing map
        Given I am on lost_animals index page
        Then I should see a map UI of my location

    Scenario: Dragging map
        Given I am on lost_animals index page
        Given I see a map UI
        When I click and drag on the map 
        Then the map should move to the opposite direction of where the mouse is dragged


Feature: Maps pin

    Scenario: User sees one pin on the map
        Given I am on the lost_animals index page
        Then I should see a pin on the map

    Scenario: Pins showing
        Given I am on lost_animals index page
        Given I see a map UI
        When a pin is being added
        When a spot on the map is clicked for the pin
        Then a pin icon should be placed on the map where it was clicked

Feature: Map Finder
    Scenario: User sees a search bar
        Given I am on lost_animals index page
        Given I see a search bar in the mao
        When I type on search bar
        Then I should see a pin been added to the map