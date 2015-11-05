require 'test_helper'

class PollUsersControllerTest < ActionController::TestCase
  setup do
    @poll_user = poll_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:poll_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create poll_user" do
    assert_difference('PollUser.count') do
      post :create, poll_user: { optionSelected: @poll_user.optionSelected, poll_id: @poll_user.poll_id, user_id: @poll_user.user_id }
    end

    assert_redirected_to poll_user_path(assigns(:poll_user))
  end

  test "should show poll_user" do
    get :show, id: @poll_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @poll_user
    assert_response :success
  end

  test "should update poll_user" do
    patch :update, id: @poll_user, poll_user: { optionSelected: @poll_user.optionSelected, poll_id: @poll_user.poll_id, user_id: @poll_user.user_id }
    assert_redirected_to poll_user_path(assigns(:poll_user))
  end

  test "should destroy poll_user" do
    assert_difference('PollUser.count', -1) do
      delete :destroy, id: @poll_user
    end

    assert_redirected_to poll_users_path
  end
end
