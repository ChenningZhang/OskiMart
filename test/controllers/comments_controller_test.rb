require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  # setting up devise 
	include Devise::TestHelpers

	def setup
	    @request.env["devise.mapping"] = Devise.mappings[:user]
		@user = create(:user)
		@user.save
	  	sign_in @user

		@post = create(:post, :user_id => @user.id)
	   	@post.save

	   	@comment = create(:comment, :post_id => @post.id, :user_id => @user.id)
	   	@comment.save

		self.use_instantiated_fixtures = true
	end

	test "should get new" do
		get :new
   	    assert_response :success
    end

	test "should get index" do
	    get :index
	    assert_response :success
	    assert_not_nil assigns(:comments)
  	end

 #  	test "create a comment" do
 #  		post :create, text: "comment"
 #  		assert_not_nil Comment.find_by(text: "comment")
	# end


end
