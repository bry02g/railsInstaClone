Feature: Make Post
  Scenario: signed in and making a post
    Given that I am signed in and on the homepage
    When I click "New Post" and fill out the form
    Then I should be able to create a post