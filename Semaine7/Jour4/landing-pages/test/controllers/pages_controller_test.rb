require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get checkr" do
    get pages_checkr_url
    assert_response :success
  end

  test "should get flynn" do
    get pages_flynn_url
    assert_response :success
  end

  test "should get sparks" do
    get pages_sparks_url
    assert_response :success
  end

  test "should get home" do
    get pages_home_url
    assert_response :success
  end

end
