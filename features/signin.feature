# encoding: utf-8
Feature: Sign in
	In order to sign in to app
	A user who is not signed in
	Should be able to sign in to the application

	Scenario: Direct user to the sign in page
		Given I am not signed in and I am on the home page
		When I visit "/boats" page
		Then I am on the "/admins/sign_in" page

	Scenario: Direct user to the sign in page
		Given I am not signed in and I am on the home page
		When I visit "/members" page
		Then I am on the "/admins/sign_in" page

	Scenario: Sign in user to the application
		Given I am on the "/" page
		And I sign up as "test@scrumboat.com" with "password"
		When I login as "test@scrumboat.com" with "password"
		Then I should be signed in

