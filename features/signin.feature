# encoding: utf-8
Feature: Sign in
	In order to sign in to app
	A user who is not signed in
	Should be able to sign in to the application

	Scenario: Direct user to the sign in page
		Given I am not signed in and I am on the home page
		When I go to the boats page
		Then I should be directed to sign in page

	Scenario: Direct user to the sign in page
		Given I am not signed in and I am on the home page
		When I go to the members page
		Then I should be directed to sign in page

	Scenario: Sign in user to the application
		Given I am on the "home page"
		And I have signed up to the application with email: "test@scrumboat.com" and password: "password"
		When I submit email "test@scrumboat.com" and password "password"
		Then I should be signed in

