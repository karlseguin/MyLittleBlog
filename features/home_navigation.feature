Feature: Home navigation
  In order to browse posts
  A user
  Wants to navigate 

  Scenario: Homepage previous navigation
    Given a bunch of posts exist
    When I am on the "home page"
    And I follow "previous"
    Then I should see "a post 11"
    And I should see "a post 7"
    And I should not see "a post 6"
    
  Scenario: Homepage next navigation
    Given a bunch of posts exist
    When I am on the "home page"
    And I follow "previous"
    And I follow "next"
    Then I should see "a post 16"
    And I should see "a post 12"
    And I should not see "a post 11"
    
  Scenario: Homepage category navigation
    Given a bunch of posts exist
    When I am on the "home page"
    And I follow "category 2"
    Then I should only see posts belonging to "category 2"