# encoding: utf-8
Feature: Sign up
	In order to sign up to the app
	A user
	Should be directed to the sign up page

	Scenario: Direct user to the sign up page
		Given I am on the sign in page
		When I click "Rekisteröidy"
		Then I should be directed to sign up page

	Scenario: Sing up a user to app
		Given I am on the sign up page
		When I submit email and password
		Then I should be signed in