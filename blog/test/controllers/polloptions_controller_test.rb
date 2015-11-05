require 'test_helper'

class PolloptionsControllerTest < ActionController::TestCase
  setup do
    @polloption = polloptions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:polloptions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create polloption" do
    assert_difference('Polloption.count') do
      post :create, polloption: { description: @polloption.description, option: @polloption.option, poll_id: @polloption.poll_id, votecount: @polloption.votecount }
    end

    assert_redirected_to polloption_path(assigns(:polloption))
  end

  test "should show polloption" do
    get :show, id: @polloption
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @polloption
    assert_response :success
  end

  test "should update polloption" do
    patch :update, id: @polloption, polloption: { description: @polloption.description, option: @polloption.option, poll_id: @polloption.poll_id, votecount: @polloption.votecount }
    assert_redirected_to polloption_path(assigns(:polloption))
  end

  test "should destroy polloption" do
    assert_difference('Polloption.count', -1) do
      delete :destroy, id: @polloption
    end

    assert_redirected_to polloptions_path
  end
end
