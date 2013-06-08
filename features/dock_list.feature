#encoding: utf-8
Feature: Create a dock
	In order to set boats in to the water in orderly fashion
	A user who is signed in
	Should be able to create a dock

	Scenario: Direct user to /docks page
	Given I sign up as "test@scrumboat.com" with "password"
	And I login as "test@scrumboat.com" with "password"
	And I am on the "/" page
	When I click "Laiturit"
	And the following docks exist:
		|	length	|
		|	30		|
		|	40		|
	Then I am on the "/docks" page
	And page should have content "Laiturit"
	And page should have content "Laituri 1"
	And page should have content "Laituri 2"
	And page should have content "30"
	And page should have content "40"

