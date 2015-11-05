require 'test_helper'

class PollsControllerTest < ActionController::TestCase
  setup do
    @poll = polls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:polls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create poll" do
    assert_difference('Poll.count') do
      post :create, poll: { anonimity: @poll.anonimity, community_id: @poll.community_id, finish_time: @poll.finish_time, interim: @poll.interim, options: @poll.options, post_id: @poll.post_id, restricted_id: @poll.restricted_id, user_id: @poll.user_id, user_response: @poll.user_response, vote_type: @poll.vote_type }
    end

    assert_redirected_to poll_path(assigns(:poll))
  end

  test "should show poll" do
    get :show, id: @poll
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @poll
    assert_response :success
  end

  test "should update poll" do
    patch :update, id: @poll, poll: { anonimity: @poll.anonimity, community_id: @poll.community_id, finish_time: @poll.finish_time, interim: @poll.interim, options: @poll.options, post_id: @poll.post_id, restricted_id: @poll.restricted_id, user_id: @poll.user_id, user_response: @poll.user_response, vote_type: @poll.vote_type }
    assert_redirected_to poll_path(assigns(:poll))
  end

  test "should destroy poll" do
    assert_difference('Poll.count', -1) do
      delete :destroy, id: @poll
    end

    assert_redirected_to polls_path
  end
end
