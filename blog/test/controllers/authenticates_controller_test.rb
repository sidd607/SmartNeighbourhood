require 'test_helper'

class AuthenticatesControllerTest < ActionController::TestCase
  setup do
    @authenticate = authenticates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:authenticates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create authenticate" do
    assert_difference('Authenticate.count') do
      post :create, authenticate: { email: @authenticate.email, password: @authenticate.password }
    end

    assert_redirected_to authenticate_path(assigns(:authenticate))
  end

  test "should show authenticate" do
    get :show, id: @authenticate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @authenticate
    assert_response :success
  end

  test "should update authenticate" do
    patch :update, id: @authenticate, authenticate: { email: @authenticate.email, password: @authenticate.password }
    assert_redirected_to authenticate_path(assigns(:authenticate))
  end

  test "should destroy authenticate" do
    assert_difference('Authenticate.count', -1) do
      delete :destroy, id: @authenticate
    end

    assert_redirected_to authenticates_path
  end
end
