require 'test_helper'

class PollOptionsControllerTest < ActionController::TestCase
  setup do
    @poll_option = poll_options(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:poll_options)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create poll_option" do
    assert_difference('PollOption.count') do
      post :create, poll_option: { description: @poll_option.description, option: @poll_option.option, poll_id: @poll_option.poll_id, votecount: @poll_option.votecount }
    end

    assert_redirected_to poll_option_path(assigns(:poll_option))
  end

  test "should show poll_option" do
    get :show, id: @poll_option
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @poll_option
    assert_response :success
  end

  test "should update poll_option" do
    patch :update, id: @poll_option, poll_option: { description: @poll_option.description, option: @poll_option.option, poll_id: @poll_option.poll_id, votecount: @poll_option.votecount }
    assert_redirected_to poll_option_path(assigns(:poll_option))
  end

  test "should destroy poll_option" do
    assert_difference('PollOption.count', -1) do
      delete :destroy, id: @poll_option
    end

    assert_redirected_to poll_options_path
  end
end
