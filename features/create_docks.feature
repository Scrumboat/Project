# encoding: utf-8
Feature: create a dock
	In order to set boats in to the water in ordely fashion
	As a user
	I want to be able to create docks

	Scenario: User clicks the dock link on the home page
		Given I log in as admin
		And I am on the "home" page		
		When I click "Laiturit" link
		Then I should be on the "/docks" page

	Scenario: User clicks the new on the docks page to create a new dock
		Given I log in as admin
		And I am on the "/docks" page
		When I click "Uusi laituri"
