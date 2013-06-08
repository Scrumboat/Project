# encoding: utf-8
Feature: Admin can add a new dock
	In order to set more boats to water
	A admin who is signed in
	Should see a form on the page

	Scenario:
	Given I login as admin
	And I am on the "/docks" page
	Then page should have content "Uusi laituri"

	Scenario:
	Given I login as admin
	And I am on the "/docks" page
	And I click "Uusi laituri"
	Then page should have button "Lisää laituri"

	Scenario:
	Given I login as admin
	And I am on the "/docks" page
	And I click "Uusi laituri"
	And I add new dock:
		|length|
		|50|
	Then page should have content "Pituus: 50.0"