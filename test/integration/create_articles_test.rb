require 'test_helper'

class CreateArticlesTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  setup do
    @article = Article.new(title: 'a very good title', description: 'a super good dssecripton', category_ids: [1,2])
  end

  test "user can create articles successfully" do
    sign_in_as(users(:john),'password')
    assert_difference 'Article.count', 1 do
      post articles_path, params: { article: { title: @article.title, description: @article.description, category_ids: @article.category_ids }}
    end
    follow_redirect!
    assert_select "#flash_success", "Article was successfully created"
    assert_template 'articles/show' # this is controller/action
  end
end
