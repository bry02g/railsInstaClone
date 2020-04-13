Feature: Editing Posts
  Scenario: signed in and editing a post's caption
    Given that I am viewing one of my posts
    When I click "Edit" and fill out the form with a new caption
    Then I should be able to change the post's caption

  Scenario: signed in and editing a post's image
    Given that I am viewing one of my posts
    When I click "Edit" and fill out the form with a new Image Url
    Then I should be able to change the post's Image Url