# encoding: utf-8
Feature: Show dock with list of berth
	In order to have boats in the water orderly fashion
	A admin how is signed in
	Should see list of berths that belong to a dock

	Scenario: Direct user to show a dock with list of berths
		Given I login as admin
		And the following docks exist:
		|length|
		|30|
		|40|
		And the following berths exist:
		|number|length|width|depth|exists|dock_id|
		|1|5.5|2.4|1.6|true|1|
		|3|5.5|2.4|1.6|true|2|
		|5|5.5|2.5|1.6|true|1|
		|7|4.5|3.5|1.7|false|2|
		And I am on the "/docks/1" page		
		Then page should have content "Laituri"
		And page should have content "30"
		And page should have content "Laituripaikat"
		And page should have content "1 5.5 m 2.4 m 1.6 m 0.0 Kyllä"
		And page should have content "5 5.5 m 2.5 m 1.6 m 0.0 Kyllä"