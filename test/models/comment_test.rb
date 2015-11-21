require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
		@comment = Comment.new(text: "Example comment", user_id: 1, post_id: 1)
	end

	test "should be valid" do
		assert @comment.valid?
	end

	test "text field should be present" do
		@comment.text = " "
		assert_not @comment.valid?
	end

	test "user_id should be an integer" do
		@comment.user_id = "a"
		assert_not @comment.valid?
	end

	test "user_id should be present" do
		@comment.user_id = nil
		assert_not @comment.valid?
	end

	test "post_id should be an integer" do
		@comment.post_id = "b"
		assert_not @comment.valid?
	end

	test "post_id should be present" do
		@comment.post_id = nil
		assert_not @comment.valid?
	end

	test "comment is valid" do
		assert @comment.valid?
	end
end
