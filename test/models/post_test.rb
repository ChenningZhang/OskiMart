require 'test_helper'

class PostTest < ActiveSupport::TestCase
	# title description category price
	def setup
		@post = Post.new(title: "Test Title", description: "Test description", category: "1", price: "2")
	end

	test "should be valid" do
		assert @post.valid?
	end

	test "title should be present" do
		@post.title = "  "
		assert_not @post.valid?
	end

	test "description should be present" do
		@post.description = "  "
		assert_not @post.valid?
	end

	test "category should be present" do
		@post.category = "  "
		assert_not @post.valid?
	end

	test "price should be present" do
		@post.price = "  "
		assert_not @post.valid?
	end
end
