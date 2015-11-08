require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  setup do
    @profile = profiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create profile" do
    assert_difference('Profile.count') do
      post :create, profile: { DOB: @profile.DOB, LastName: @profile.LastName, community_id: @profile.community_id, door_no: @profile.door_no, email: @profile.email, firstName: @profile.firstName, gender: @profile.gender, inactive: @profile.inactive, phone: @profile.phone, role_id: @profile.role_id, showPhone: @profile.showPhone, verified: @profile.verified, verify_id: @profile.verify_id, verifytime: @profile.verifytime }
    end

    assert_redirected_to profile_path(assigns(:profile))
  end

  test "should show profile" do
    get :show, id: @profile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @profile
    assert_response :success
  end

  test "should update profile" do
    patch :update, id: @profile, profile: { DOB: @profile.DOB, LastName: @profile.LastName, community_id: @profile.community_id, door_no: @profile.door_no, email: @profile.email, firstName: @profile.firstName, gender: @profile.gender, inactive: @profile.inactive, phone: @profile.phone, role_id: @profile.role_id, showPhone: @profile.showPhone, verified: @profile.verified, verify_id: @profile.verify_id, verifytime: @profile.verifytime }
    assert_redirected_to profile_path(assigns(:profile))
  end

  test "should destroy profile" do
    assert_difference('Profile.count', -1) do
      delete :destroy, id: @profile
    end

    assert_redirected_to profiles_path
  end
end
