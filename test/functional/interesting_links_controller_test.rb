require 'test_helper'

class InterestingLinksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:interesting_links)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create interesting_link" do
    assert_difference('InterestingLink.count') do
      post :create, :interesting_link => { }
    end

    assert_redirected_to interesting_link_path(assigns(:interesting_link))
  end

  test "should show interesting_link" do
    get :show, :id => interesting_links(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => interesting_links(:one).to_param
    assert_response :success
  end

  test "should update interesting_link" do
    put :update, :id => interesting_links(:one).to_param, :interesting_link => { }
    assert_redirected_to interesting_link_path(assigns(:interesting_link))
  end

  test "should destroy interesting_link" do
    assert_difference('InterestingLink.count', -1) do
      delete :destroy, :id => interesting_links(:one).to_param
    end

    assert_redirected_to interesting_links_path
  end
end
