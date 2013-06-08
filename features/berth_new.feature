# encoding: utf-8
Feature: Admin can add a new berth to a dock
	In order to set more boats to water
	A admin who is signed in
	Should see a form on the page

	Scenario:
	Given I login as admin
	And the following docks exist:
		|length|
		|30|
		|40|
	And I am on the "/docks/1" page
	Then page should have content "Uusi laituripaikka"

	Scenario:
	Given I login as admin
	And the following docks exist:
		|length|
		|30|
		|40|
	And I am on the "/docks/1" page
	And I click "Uusi laituripaikka"
	Then page should have button "Lisää laituripaikka"

	Scenario:
	Given I login as admin
	And the following docks exist:
		|length|
		|30|
		|40|
	And I am on the "/docks/1" page
	And I click "Uusi laituripaikka"
	And I add new berth:
		|number|length|width|depth|exists|
		|9|3|2|1.5|true|
	Then page should have content "Laituripaikka 9 3.0 2.0 1.5 true"
