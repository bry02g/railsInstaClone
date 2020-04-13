Feature: Deleting Posts
  @javascript
  Scenario: deleting a post from my profile
    Given there are two users with posts, Bob and Mary
    And I sign in as Bob
    And I am viewing one of my posts
    When I click "Destroy" and confirm
    Then that post should be deleted