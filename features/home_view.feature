Feature: Home view
  In order to view the blog
  A user
  Goes to the website
  
  Scenario: Homepage shows 5 latest posts
    Given a bunch of posts exist
    When I am on the "home page"
    Then I should see "a post 16" before "a post 15"
    And I should see "a post 15" before "a post 14"
    And I should see "a post 14" before "a post 13"
    And I should see "a post 13" before "a post 12"
    And I should not see "a post 11"
    
  Scenario: Displays message when no posts are found
    When I am on the "home page"
    Then I should see "Sorry, no posts were found"
    
  Scenario: Homepage previous link
    Given a bunch of posts exist
    When I am on the "home page"
    Then I should see "previous" within "a[@class='prev']"
    
  Scenario: Homepage next link
    Given a bunch of posts exist
    When I am on the "home page"
    And I follow "previous"
    Then I should see "next" within "a[@class='next']"