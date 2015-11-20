require 'test_helper'

class PostsControllerTest < ActionController::TestCase
	# single devise bullshit
	include Devise::TestHelpers

	self.use_instantiated_fixtures = true

	def setup
		# double devise bullshit
    @request.env["devise.mapping"] = Devise.mappings[:user]

		# make a dummy user
		@user = User.new(:first_name => 'test_first_name',
											:last_name => 'test_last_name',
											:email => 'test@berkeley.edu',
											:password => 'test_password',
											:password_confirmation => 'test_password'
		)
		@user.save

		# triple devise bullshit
  	sign_in @user

		# make a dummy post
		@post = Post.new(title: 'Test', description: 'Post Controller', category: '2', price: '1')
   	@post.save

  end

  test "should get new" do
		get :new
   	assert_response :success
  end

  # index show create
	test  "should get index" do
	 	get :index
	 	assert_response :success
	end

	test "should get show" do
	 	get :show, id: @post.id
	 	assert_response :success
	end

	test "should create new post" do
		post :create, post: {
	 							title: 'Test title',
	 							description: 'Controller Description',
	 							category: '1',
	 							price: '3'
	 	}
	 	assert_redirected_to posts_path
	end

	test "not signed in user should not create new post" do
		#TODO: test the render new in postcontroller.create
	end

  test "should display all posts" do
   	get :index
   	assert_response :success
   	assert_template :index
  end

  test "should display posts by $ price" do
   	get :index, {'price' => '$'}  #'%24'
   	assert_response :success
   	assert_template :index
  end


  test "should display posts by $$ price" do
   	get :index, {'price' => '$$'}  #'%24'
   	assert_response :success
   	assert_template :index
  end

  test "should display posts by $$$ price" do
  	get :index, {'price' => '$$$'}  #'%24'
   	assert_response :success
   	assert_template :index
  end

	# REQUIRES FURTHER DISCUSSION. IDK WTF YOU GUYS ARE DOING HERE.
  # test "should display posts by Books category" do
  #  	get :index, {'category_id' => 'Books'}  #'%24'
		# posts.each do |post|
  # 		assert_equal(post.category, 'Books')
		# end
		# # Post.all.each do |post|
		# # 	puts post.inspect
		# # 	#assert_equal(post.category, 'Books')
		# # end
  #   #
  #
  #  	assert_response :success
  #  	assert_template :index
  # end
  #
  # test "should display posts by Technology category" do
  #  	get :index, {'category_id' => 'Technology'}  #'%24'
  #  	posts.each do |post|
  #  		assert_equal(post.category, 'Technology')
  #  	end
  #  	assert_response :success
  #  	assert_template :index
  # end
  #
  # test "should display posts by Furniture category" do
  #  	get :index, {'category_id' => 'Furniture'}  #'%24'
  #  	posts.each do |post|
  #  		assert_equal(post.category, 'Furniture')
  #  	end
  #  	assert_response :success
  #  	assert_template :index
  # end
  #
  # test "should display posts by Service category" do
  #  	get :index, {'category_id' => 'Service'}  #'%24'
  #  	posts.each do |post|
  #  		assert_equal(post.category, 'Service')
		# 	puts post.category
  #  	end
  #  	assert_response :success
  #  	assert_template :index
  # end
  #
  # test "should display posts by Other category" do
  #  	get :index, {'category_id' => 'Other'}  #'%24'
  #  	posts.each do |post|
  #  		assert_equal(post.category, 'Other')
  #  	end
  #  	assert_response :success
  #  	assert_template :index
  # end
  #
  # test "should display posts by all category" do
  #  	get :index, {'category_id' => ''}  #'%24'
  #  	assert_equal(posts.size, Post.count)
  #  	assert_response :success
  #  	assert_template :index
  # end
end
