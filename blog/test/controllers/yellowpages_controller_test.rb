require 'test_helper'

class YellowpagesControllerTest < ActionController::TestCase
  setup do
    @yellowpage = yellowpages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:yellowpages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create yellowpage" do
    assert_difference('Yellowpage.count') do
      post :create, yellowpage: { AveRating: @yellowpage.AveRating, address: @yellowpage.address, community_id: @yellowpage.community_id, description: @yellowpage.description, name: @yellowpage.name, phone: @yellowpage.phone, totalRatings: @yellowpage.totalRatings, user_id: @yellowpage.user_id, verified: @yellowpage.verified }
    end

    assert_redirected_to yellowpage_path(assigns(:yellowpage))
  end

  test "should show yellowpage" do
    get :show, id: @yellowpage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @yellowpage
    assert_response :success
  end

  test "should update yellowpage" do
    patch :update, id: @yellowpage, yellowpage: { AveRating: @yellowpage.AveRating, address: @yellowpage.address, community_id: @yellowpage.community_id, description: @yellowpage.description, name: @yellowpage.name, phone: @yellowpage.phone, totalRatings: @yellowpage.totalRatings, user_id: @yellowpage.user_id, verified: @yellowpage.verified }
    assert_redirected_to yellowpage_path(assigns(:yellowpage))
  end

  test "should destroy yellowpage" do
    assert_difference('Yellowpage.count', -1) do
      delete :destroy, id: @yellowpage
    end

    assert_redirected_to yellowpages_path
  end
end
