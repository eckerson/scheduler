Feature: Managing locations
	In order to host events
	As an administrator
	I want to be able to create and manage locations

	Scenario: Create Valid Location
		Given I have no locations
		And I am on the list of locations
		When I follow "New Location"
		And I fill in "name" with "Conference Center"
		And I fill in "address1" with "1234 W Main St"
		And I fill in "address2" with "Suite 123"
		And I fill in "address3" with "Phoenix"
		And I fill in "address4" with "AZ"
		And I fill in "address5" with "85029"
		And I press "Create Location"
		Then I should see "Location was successfully created."
		And I should see "Conference Center"
		And I should have 1 location

	Scenario: Edit Valid Location
		Given I have a location named "Conference Center"
		When I fill in "address5" with "85008"
		Then the location should have an address5 of "85008"
