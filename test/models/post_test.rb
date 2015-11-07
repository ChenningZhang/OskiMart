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

		keywordFail1 = 'aiwero;q'
		keywordFail2 = 'wintery'
		keywordFail3 = 'SalAD'

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

		no_posts = Post.search(keywordFail1)
		no_posts2 = Post.search(keywordFail2)
		no_posts3 = Post.search(keywordFail3)
		assert_empty(no_posts)
		assert_empty(no_posts2)
		assert_empty(no_posts3)



	end
	test "filter by price" do
		filter1 = '$'
		filter2 = '$$'
		filter3 = '$$$'

		improperFilter = 'aasdf'
		improperFilter2 = '4'

		assert_empty(Post.filter(improperFilter))
		assert_empty(Post.filter(improperFilter2))

		filtered_posts = Post.filter(filter1)
		assert_equal(3, filtered_posts.count())
		for post in filtered_posts
			assert_equal('$', post.price)
		end

		filtered_posts = Post.filter(filter2)
		assert_equal(2, filtered_posts.count())
		for post in filtered_posts
			assert_equal('$$', post.price)
		end

		filtered_posts = Post.filter(filter3)
		assert_equal(1, filtered_posts.count())
		for post in filtered_posts
			assert_equal('$$$', post.price)
		end
		
	end

end