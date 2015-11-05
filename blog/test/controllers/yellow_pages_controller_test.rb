require 'test_helper'

class YellowPagesControllerTest < ActionController::TestCase
  setup do
    @yellow_page = yellow_pages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:yellow_pages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create yellow_page" do
    assert_difference('YellowPage.count') do
      post :create, yellow_page: { AveRating: @yellow_page.AveRating, address: @yellow_page.address, community_id: @yellow_page.community_id, description: @yellow_page.description, name: @yellow_page.name, page_id: @yellow_page.page_id, phone: @yellow_page.phone, totalRatings: @yellow_page.totalRatings, user_id: @yellow_page.user_id, verified: @yellow_page.verified }
    end

    assert_redirected_to yellow_page_path(assigns(:yellow_page))
  end

  test "should show yellow_page" do
    get :show, id: @yellow_page
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @yellow_page
    assert_response :success
  end

  test "should update yellow_page" do
    patch :update, id: @yellow_page, yellow_page: { AveRating: @yellow_page.AveRating, address: @yellow_page.address, community_id: @yellow_page.community_id, description: @yellow_page.description, name: @yellow_page.name, page_id: @yellow_page.page_id, phone: @yellow_page.phone, totalRatings: @yellow_page.totalRatings, user_id: @yellow_page.user_id, verified: @yellow_page.verified }
    assert_redirected_to yellow_page_path(assigns(:yellow_page))
  end

  test "should destroy yellow_page" do
    assert_difference('YellowPage.count', -1) do
      delete :destroy, id: @yellow_page
    end

    assert_redirected_to yellow_pages_path
  end
end
