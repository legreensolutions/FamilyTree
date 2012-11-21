require 'test_helper'

class ContentManagementsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:content_managements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create content_management" do
    assert_difference('ContentManagement.count') do
      post :create, :content_management => { }
    end

    assert_redirected_to content_management_path(assigns(:content_management))
  end

  test "should show content_management" do
    get :show, :id => content_managements(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => content_managements(:one).to_param
    assert_response :success
  end

  test "should update content_management" do
    put :update, :id => content_managements(:one).to_param, :content_management => { }
    assert_redirected_to content_management_path(assigns(:content_management))
  end

  test "should destroy content_management" do
    assert_difference('ContentManagement.count', -1) do
      delete :destroy, :id => content_managements(:one).to_param
    end

    assert_redirected_to content_managements_path
  end
end
