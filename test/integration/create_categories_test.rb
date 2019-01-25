require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
  
  test "get new category form and create category" do
    get new_category_path
    assert_template 'categories/new'
    assert_difference 'Category.count', 1 do # the difference of 'Category.count' after block execution yields, should be 1, means there should be exactly 1 category record created
      post categories_path, params: { category: { name: "sports"}}
      follow_redirect! # follow to next one redirection
    end
    assert_template 'categories/index' # go back to index page
    assert_match "sports", response.body
  end
end
