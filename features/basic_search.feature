Feature: Basic Search
  As a user
  I want to enter my search terms in a single field
  So that I can search easily

Scenario: Keyword Search
  Given I search for a keyword
  Then I should see results containing that keyword
