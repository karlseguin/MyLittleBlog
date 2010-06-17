Feature: Post navigation
  In order to navigate between posts
  A user
  Wants to click the next and previous entries

  Scenario: Post with previous entry
    Given some posts exist    
    When I am on "post view 4"
    Then I should see "a post 3" within "a[@class='prev']"
  
  Scenario: Post with next entry
    Given some posts exist    
    When I am on "post view 1"
    Then I should see "a post 2" within "a[@class='next']"
  
  Scenario: Post with previous and next entry
    Given some posts exist    
    When I am on "post view 2"
    Then I should see "a post 1" within "a[@class='prev']"
    And I should see "a post 3" within "a[@class='next']"
  
  Scenario: Viewing the previous entry
    Given some posts exist
    When I am on "post view 2"
    And I follow "a post 1"
    Then I should see "body 1"
  
  Scenario: Viewing the next entry
    Given some posts exist
    When I am on "post view 2"
    And I follow "a post 3"
    Then I should see "body 3"