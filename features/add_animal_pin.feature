Feature: Adding lost animal to map and lost animal news list when clicking add lost animal pin

Scenario: Clicking add lost Animal Pops up Message to Add Animal Info
    Given I am on the homepage
    When I click on the "animallost" button
    Then a message pops up saying "Add Animal Info"
    Then a button shows saying "Add animal"

Scenario: Adding information into info box
    Given I am on the homepage
    Given a pop up box says "Add Animal Info"
    When I fill in the information box 
    When I click on the lost animal button
    Then the news box will have a new string showing "animal_breed animal_distance animal_lost" 

Scenario: Adding pin to map at clicked location
    Given I am on the homepage
    Given I clicked on the "animallost" button
    Given I filled out the information box
    When I click on the "Add Animal" button
    When I click on the map
    Then that information will be stored to that pin
    Then a pin will be added to the map where the mouse was clicked

Scenario: Clicking on pin on map
    Given I am on the homepage
    Given a pin is on the map
    When I click on a pin
    Then I should see an information box with the information saved to it


Feature: Adding found animal to map and lost animal news list when clicking add found animal pinScenario: Clicking add lost Animal Pops up Message to Add Animal Info
    Given I am on the homepage
    When I click on the "animalfound" button
    Then a message pops up saying "Add Animal Info"
    Then a button shows saying "Add animal"

Scenario: Adding information into info box
    Given I am on the homepage
    Given a pop up box says "Add Animal Info"
    When I fill in the information box 
    When I click on the found animal button
    Then the news box will have a new string showing "animal_breed animal_distance animal_found" 

Scenario: Adding pin to map at clicked location
    Given I am on the homepage
    Given I clicked on the "animalfound" button
    Given I filled out the information box
    When I click on the "Add Animal" button
    When I click on the map
    Then that information will be stored to that pin
    Then a pin will be added to the map where the mouse was clicked

Scenario: Clicking on pin on map
    Given I am on the homepage
    Given a pin is on the map
    When I click on a pin
    Then I should see an information box with the information saved to it

