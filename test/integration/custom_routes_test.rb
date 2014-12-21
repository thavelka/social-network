require 'test_helper'

class CustomRoutesTest < ActionDispatch::IntegrationTest

  test "/login route opens login page" do
    get '/login'
    assert_response :success
  end
  
  test "/logout route ends session" do
    get '/logout'
    assert_response :redirect
    assert_redirected_to '/'
  end

end
