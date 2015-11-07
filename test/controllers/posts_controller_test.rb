require 'test_helper'

class PostsControllerTest < ActionController::TestCase

	# include Devise::TestHelpers

	# def setup
 #    	@user = User.new(first_name: 'Test', last_name: 'Example', email: 'test@example.com',
 #        password: '12345678', password_confirmation: '12345678')
 #    	@user.save
 #    	sign_in @user

 #    	@post = Post.new(title: 'Test', description: 'Post Controller', category: '2', price: '1')
 #    	@post.save
 #  	end

 #  	test "should get new" do
 #    	get :new
 #    	assert_response :success
 #  	end

 #  # index show create
	# test  "should get index" do
	# 	get :index
	# 	assert_redirected_to posts_path
	# end

	# test "should get show" do
	# 	get :show, id: @post.id
	# 	assert_redirected_to @post
	# end

	# test "should create new post" do
	# 	post :create, post: {
	# 							title: 'Test title',
	# 							description: 'Controller Description',
	# 							category: '1',
	# 							price: '3'
	# 						}
	# 	assert_redirected_to posts_path
	# end

  


  # test "should display all posts" do
  # 	get :index
  # 	assert_response :success
  # 	assert_template :index
  # end

  # test "should display posts by $ price" do
  # 	get :index, {'price' => '$'}  #'%24'
  # 	assert_response :success
  # 	assert_template :index
  # end


  # test "should display posts by $$ price" do
  # 	get :index, {'price' => '$$'}  #'%24'
  # 	assert_response :success
  # 	assert_template :index
  # end

  # test "should display posts by $$$ price" do
  # 	get :index, {'price' => '$$$'}  #'%24'
  # 	assert_response :success
  # 	assert_template :index
  # end


  # test "should display posts by Books category" do
  # 	get :index, {'category_id' => 'Books'}  #'%24'
  # 	@posts.each do |post|
  # 		assert_equal(post.category, 'Books')
  # 	end
  # 	assert_response :success
  # 	assert_template :index
  # end

  # test "should display posts by Technology category" do
  # 	get :index, {'category_id' => 'Technology'}  #'%24'
  # 	@posts.each do |post|
  # 		assert_equal(post.category, 'Technology')
  # 	end
  # 	assert_response :success
  # 	assert_template :index
  # end

  # test "should display posts by Furniture category" do
  # 	get :index, {'category_id' => 'Furniture'}  #'%24'
  # 	@posts.each do |post|
  # 		assert_equal(post.category, 'Furniture')
  # 	end
  # 	assert_response :success
  # 	assert_template :index
  # end

  # test "should display posts by Service category" do
  # 	get :index, {'category_id' => 'Service'}  #'%24'
  # 	@posts.each do |post|
  # 		assert_equal(post.category, 'Service')
  # 	end
  # 	assert_response :success
  # 	assert_template :index
  # end

  # test "should display posts by Other category" do
  # 	get :index, {'category_id' => 'Other'}  #'%24'
  # 	@posts.each do |post|
  # 		assert_equal(post.category, 'Other')
  # 	end
  # 	assert_response :success
  # 	assert_template :index
  # end

  # test "should display posts by all category" do
  # 	get :index, {'category_id' => ''}  #'%24'
  # 	assert_equal(len(@posts), len(Post.all))
  # 	assert_response :success
  # 	assert_template :index
  # end

end
