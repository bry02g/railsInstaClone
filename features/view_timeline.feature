Feature: View Timeline
  Scenario: Visiting homepage when signed in
    Given there are two users with posts, Bob and Mary
    And I sign in as Bob
    When I visit the homepage
    Then I should see the everyone's posts
    And everyone's posts should be in reverse order