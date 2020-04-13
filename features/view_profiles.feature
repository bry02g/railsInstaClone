Feature: View Profiles
  Scenario: when signed in and visiting my own profile from homepage
    Given there are two users with posts, Bob and Mary
    And I sign in as Bob
    And on the homepage
    When I click "Me"
    Then I should see my profile

  Scenario: when viewing timeline and I see someone elses post
    Given there are two users with posts, Bob and Mary
    And I sign in as Bob
    And I am viewing the timeline
    When I click someones username
    Then I should see their profile

  Scenario: when visiting a profile
    Given there are two users with posts, Bob and Mary
    And I sign in as Bob
    When I view Mary's profile
    Then I should see her email address
    And I should see her posts
    And the posts should be in reverse order