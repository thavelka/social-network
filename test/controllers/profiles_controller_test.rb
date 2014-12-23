require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, id: users(:tim).profile_name
    assert_response :success
    assert_template 'profiles/show'
  end
  
  test "should 404 on bad profile_name" do
    get :show, id: "doesn't exist"
    assert_response :not_found
  end

  test "variables assigned correctly on page load" do
    get :show, id: users(:tim).profile_name
    assert assigns(:user)
    assert_not_empty assigns(:statuses)
  end
  
  test "should show only correct user's statuses" do
    get :show, id: users(:tim).profile_name
    assigns(:statuses).each do |status|
      assert_equal users(:tim), status.user
    end
  end

  
end
