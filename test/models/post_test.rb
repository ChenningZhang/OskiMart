require 'test_helper'

class PostTest < ActiveSupport::TestCase
	# title description category price
	def setup
		@post = Post.new(title: "Test Title", description: "Test description", category: "1", price: "2")
	end

	test "should be valid" do
		#puts Post.all.inspect
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


	test "search by keyword" do
		keyword1 = 'Refrigerator'
		keyword2 = 'refrigerator'
		keyword3 = 'warm'
		keyword4 = 'clAssic'
		keyword5 = 'book'

		search_posts = Post.search(keyword1)
		assert_equal(posts(:refrigerator), search_posts.first, 'Exact search for Refrigerator returns wrong post')
		search_posts = Post.search(keyword2)
		assert_equal(posts(:refrigerator), search_posts.first, 'Case insensitive search for refrigerator returns wrong post')
		search_posts = Post.search(keyword3)
		assert_equal(posts(:jacket), search_posts.first, 'Search for warm does not return jacket post')
		search_posts = Post.search(keyword4)
		assert_equal(posts(:harry_potter), search_posts.first, 'Case insensitive search for clAssic does not return harry potter book')


		search_posts = Post.search(keyword5) #should return 2 books
		assert_includes(search_posts, posts(:harry_potter), 'Harry Potter book not in search for book')
		assert_includes(search_posts, posts(:finance_book), 'Finance textbook not in search for book')
	end

end
