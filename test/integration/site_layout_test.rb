require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
	test "layout links" do
		get root_path
		assert_template 'home'
		assert_select "a[href=?]", signup_path
		assert_select "a[href=?]", login_path
	end
end
