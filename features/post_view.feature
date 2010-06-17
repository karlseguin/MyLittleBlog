Feature: Viewing a Post
  In order to view a post
  A user
  Wants to enter the post slug
  
  Scenario: Post not found
    Given I am on "a post"
    Then I should be on the "home page"
    
  Scenario: Post found
    Given a post exists with slug: "a-post", title: "this is my post", summary: "the post summary", body: "the body", category_id: "0", created_at: "2010-01-20"
    When I am on "a post"
    Then I should see "this is my post"
    And I should see "the post summary"
    And I should see "the body"
    And I should see "Wednesday, January 20, 2010"