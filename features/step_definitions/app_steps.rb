Then /^I should see "([^\"]*)" before "([^\"]*)"$/ do |first, second|
  assert_not_nil page.body.match(/#{first}.*#{second}/m), "Should see #{first} before #{second}"
end

Then /^I should only see posts belonging to "([^\"]*)"$/ do |category|
  if category == 'category 2'
    Then %{I should see "a post 11"}
    Then %{I should see "a post 9"}
    Then %{I should see "a post 6"}
    Then %{I should see "a post 5"}
    Then %{I should see "a post 4"}
    Then %{I should not see "a post 3"}
    Then %{I should not see "a post 12"}
  end
end

Given /^a bunch of posts exist$/ do
  Given %{a category exists with name: "category 1"}
  Given %{a category exists with name: "category 2"}
  Given %{a category exists with name: "category 3"}
  data = <<-eos
  | slug        | title     | summary       | created_at | category_id | body     |
  | post-1      | a post 1  | a summary 1   | 2010-01-05 | 1           | body 1   |
  | post-2      | a post 2  | a summary 2   | 2010-01-10 | 1           | body 2   |
  | post-3      | a post 3  | a summary 3   | 2010-01-15 | 2           | body 3   |
  | post-4      | a post 4  | a summary 4   | 2010-01-20 | 2           | body 4   |
  | post-5      | a post 5  | a summary 5   | 2010-01-21 | 2           | body 5   |
  | post-6      | a post 6  | a summary 6   | 2010-01-22 | 2           | body 6   |
  | post-7      | a post 7  | a summary 7   | 2010-01-23 | 1           | body 7   |
  | post-8      | a post 8  | a summary 8   | 2010-01-24 | 1           | body 8   |
  | post-9      | a post 9  | a summary 9   | 2010-01-25 | 2           | body 9   |
  | post-10     | a post 10 | a summary 10  | 2010-01-26 | 1           | body 10  |
  | post-11     | a post 11 | a summary 11  | 2010-01-27 | 2           | body 11  |
  | post-12     | a post 12 | a summary 12  | 2010-01-28 | 1           | body 12  |
  | post-13     | a post 13 | a summary 13  | 2010-01-29 | 1           | body 13  |
  | post-14     | a post 14 | a summary 14  | 2010-01-30 | 3           | body 14  |
  | post-15     | a post 15 | a summary 15  | 2010-01-31 | 3           | body 15  |
  | post-16     | a post 16 | a summary 16  | 2010-02-01 | 1           | body 16  |
  eos
  table = Cucumber::Ast::Table.parse(data,nil, nil)
  create_models_from_table('posts', table)
end

Given /^some posts exist$/ do
  data = <<-eos
| slug        | title     | summary       | created_at | category_id | body     |
| post-1      | a post 1  | a summary 1   | 2010-01-05 | 1           | body 1   |
| post-2      | a post 2  | a summary 2   | 2010-01-10 | 1           | body 2   |
| post-3      | a post 3  | a summary 3   | 2010-01-15 | 1           | body 3   |
| post-4      | a post 4  | a summary 4   | 2010-01-20 | 1           | body 4   |
eos
    table = Cucumber::Ast::Table.parse(data, nil, nil)
    create_models_from_table('posts', table)
end