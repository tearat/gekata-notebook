require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  test "should create article" do
    tag = Tag.first
    assert Article.create(:title => 'Test', :body => 'Body test', :tag_id => tag.id)
  end

  test "should not create article with wrong tag_id" do
    assert_not Article.create(:title => 'Test', :body => 'Body test', :tag_id => -1).valid?
  end

  test "should not create article with empty tag_id" do
    assert_not Article.create(:title => 'Test', :body => 'Body test', :tag_id => nil).valid?
  end

  test "should not create article with empty title" do
    tag = Tag.first
    assert_not Article.create(:title => nil, :body => 'Body test', :tag_id => tag.id).valid?
  end

  test "should not create article with empty body" do
    tag = Tag.first
    assert_not Article.create(:title => 'Test', :body => nil, :tag_id => tag.id).valid?
  end
end
