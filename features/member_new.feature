# encoding: utf-8
Feature: Admin can add a new member
  In order to insert more members
  A admin who is signed in
  Should see a form on the page

  Scenario:
    Given I login as admin
    And I am on the "/members" page
    Then page should have content "Luo uusi jäsen"

  Scenario:
    Given I login as admin
    And I am on the "/members" page
    And I click "Luo uusi jäsen"
    Then page should have button "Luo jäsen"

  Scenario:
    Given I login as admin
    And I am on the "/members" page
    And I click "Luo uusi jäsen"
    And I add new member:
      |Nimi|Jäsennumero|Sotu|Osoite|Posti|Matkapuh|Jäsentyyppi|
      |Kermaa|1245|010101-001A|Osoite1|Posti1|044-0440440|Ainaisjäsen|
    Then page should have content "Nimi: Kermaa"
    And page should have content "Osoite: Osoite1"