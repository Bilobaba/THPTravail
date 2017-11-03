require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get events_create_url
    assert_response :success
  end

  test "should get new" do
    get events_new_url
    assert_response :success
  end

  test "should get delete" do
    get events_delete_url
    assert_response :success
  end

  test "should get subscribe" do
    get events_subscribe_url
    assert_response :success
  end

  test "should get index" do
    get events_index_url
    assert_response :success
  end

end
