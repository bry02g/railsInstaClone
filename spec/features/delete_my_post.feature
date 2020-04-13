Feature: Deleting Posts
  Scenario: deleting a post from my profile
    Given that I am viewing one of my posts
    When I click "Delete" and hit "Ok" to confirm
    Then that post should be deleted