require 'test_helper'

class ModeratorsControllerTest < ActionController::TestCase
  setup do
    @moderator = moderators(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:moderators)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create moderator" do
    assert_difference('Moderator.count') do
      post :create, :moderator => @moderator.attributes
    end

    assert_redirected_to moderator_path(assigns(:moderator))
  end

  test "should show moderator" do
    get :show, :id => @moderator.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @moderator.to_param
    assert_response :success
  end

  test "should update moderator" do
    put :update, :id => @moderator.to_param, :moderator => @moderator.attributes
    assert_redirected_to moderator_path(assigns(:moderator))
  end

  test "should destroy moderator" do
    assert_difference('Moderator.count', -1) do
      delete :destroy, :id => @moderator.to_param
    end

    assert_redirected_to moderators_path
  end
end
