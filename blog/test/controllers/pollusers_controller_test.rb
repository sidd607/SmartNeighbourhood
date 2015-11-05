require 'test_helper'

class PollusersControllerTest < ActionController::TestCase
  setup do
    @polluser = pollusers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pollusers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create polluser" do
    assert_difference('Polluser.count') do
      post :create, polluser: { optionSelected: @polluser.optionSelected, poll_id: @polluser.poll_id, user_id: @polluser.user_id }
    end

    assert_redirected_to polluser_path(assigns(:polluser))
  end

  test "should show polluser" do
    get :show, id: @polluser
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @polluser
    assert_response :success
  end

  test "should update polluser" do
    patch :update, id: @polluser, polluser: { optionSelected: @polluser.optionSelected, poll_id: @polluser.poll_id, user_id: @polluser.user_id }
    assert_redirected_to polluser_path(assigns(:polluser))
  end

  test "should destroy polluser" do
    assert_difference('Polluser.count', -1) do
      delete :destroy, id: @polluser
    end

    assert_redirected_to pollusers_path
  end
end
