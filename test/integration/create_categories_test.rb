require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
  
  def setup # callback before every single test

  end

  def teardown # callback after every single test

  end

  test "get new category form and create category" do
    sign_in_as(users(:admin),'password')
    get new_category_path
    assert_template 'categories/new'
    assert_difference 'Category.count', 1 do # the difference of 'Category.count' after block execution yields, should be 1, means there should be exactly 1 category record created
      post categories_path, params: { category: { name: "sports"}}
      follow_redirect! # follow to next one redirection
    end
    assert_template 'categories/index' # go back to index page
    assert_match "sports", response.body
  end

  test "invalid category submission results in failure" do
    sign_in_as(users(:admin),'password')
    get new_category_path
    assert_template 'categories/new'
    assert_no_difference 'Category.count' do # the difference of 'Category.count' after block execution yields, should be 1, means there should be exactly 1 category record created
      post categories_path, params: { category: { name: " "}}
    end
    assert_template 'categories/new' # error, render 'new'
  end
end
