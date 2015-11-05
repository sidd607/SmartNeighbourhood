require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { DOB: @user.DOB, LastName: @user.LastName, community_id: @user.community_id, door_no: @user.door_no, email: @user.email, firstName: @user.firstName, gender: @user.gender, inactive: @user.inactive, phone: @user.phone, role_id: @user.role_id, showPhone: @user.showPhone, verified: @user.verified, verify_id: @user.verify_id, verifytime: @user.verifytime }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    patch :update, id: @user, user: { DOB: @user.DOB, LastName: @user.LastName, community_id: @user.community_id, door_no: @user.door_no, email: @user.email, firstName: @user.firstName, gender: @user.gender, inactive: @user.inactive, phone: @user.phone, role_id: @user.role_id, showPhone: @user.showPhone, verified: @user.verified, verify_id: @user.verify_id, verifytime: @user.verifytime }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
