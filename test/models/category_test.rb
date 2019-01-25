 require 'test_helper'

 class CategoryTest < ActiveSupport::TestCase

  # will be run before every test case
  def setup
    @category = Category.new(name: "sports")
  end

  test "category should be valid" do
    assert @category.valid?
  end

  test "name should be present" do
    @category.name = " "
    assert_not @category.valid?
  end

  test "name should be unique" do
    @category.save
    category2 = Category.new(name: "sports")
    assert_not category2.valid?
  end

  test "name shold be maximum 25 characters" do
    @category.name = 'a' * 26
    assert_not @category.valid?
  end

  test "name shold be minimum 3 characters" do
    @category.name = 'a' * 2
    assert_not @category.valid?
  end
end