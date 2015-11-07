require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
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


  test "should display posts by Books category" do
  	get :index, {'category_id' => 'Books'}  #'%24'
  	@posts.each do |post|
  		assert_equal(post.category, 'Books')
  	end
  	assert_response :success
  	assert_template :index
  end

  test "should display posts by Technology category" do
  	get :index, {'category_id' => 'Technology'}  #'%24'
  	@posts.each do |post|
  		assert_equal(post.category, 'Technology')
  	end
  	assert_response :success
  	assert_template :index
  end

  test "should display posts by Furniture category" do
  	get :index, {'category_id' => 'Furniture'}  #'%24'
  	@posts.each do |post|
  		assert_equal(post.category, 'Furniture')
  	end
  	assert_response :success
  	assert_template :index
  end

  test "should display posts by Service category" do
  	get :index, {'category_id' => 'Service'}  #'%24'
  	@posts.each do |post|
  		assert_equal(post.category, 'Service')
  	end
  	assert_response :success
  	assert_template :index
  end

  test "should display posts by Other category" do
  	get :index, {'category_id' => 'Other'}  #'%24'
  	@posts.each do |post|
  		assert_equal(post.category, 'Other')
  	end
  	assert_response :success
  	assert_template :index
  end

  test "should display posts by all category" do
  	get :index, {'category_id' => ''}  #'%24'
  	assert_equal(len(@posts), len(Post.all))
  	assert_response :success
  	assert_template :index
  end



end
