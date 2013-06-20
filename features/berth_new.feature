# encoding: utf-8
Feature: Admin can add a new berth to a dock
	In order to set more boats to water
	A admin who is signed in
	Should see a form on the page

	Scenario: User navigates to some laituri page
	Given I login as admin
	And the following docks exist:
		|length|
		|30|
		|40|
	And I am on the "/docks/1" page
	Then page should have content "Uusi laituripaikka"

	Scenario: User clicks Lisää laituripaikka
	Given I login as admin
	And the following docks exist:
		|length|
		|30|
		|40|
	And I am on the "/docks/1" page
	And I click "Uusi laituripaikka"
	Then page should have button "Lisää laituripaikka"

	Scenario: User add a new laituripaikka
	Given I login as admin
	And the following docks exist:
		|length|
		|30|
		|40|
	And I am on the "/docks/1" page
	And I click "Uusi laituripaikka"
	And I add new berth:
		|number|length|width|depth|vartio|exists|
		|9|3|2|1.5|2013-06-20|true|
	Then page should have content "9 3.0 m 2.0 m 1.5 m 2013-06-20 Kyllä"

	Scenario: Laituri is full when user tries to add new laituripaikka
	Given I login as admin
	And the following docks exist:
		|length|
		|30|
		|40|
	And I am on the "/docks/1" page
	And I click "Uusi laituripaikka"
	And I add new berth:
		|number|length|width|depth|exists|
		|2|5|31|1.5|true|
	Then page should have content "Laituripaikkojen leveys ylitti laiturin leveyden."
