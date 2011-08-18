require 'test_helper'

class AlertsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:alerts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create alert" do
    assert_difference('Alert.count') do
      post :create, :alert => { }
    end

    assert_redirected_to alert_path(assigns(:alert))
  end

  test "should show alert" do
    get :show, :id => alerts(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => alerts(:one).to_param
    assert_response :success
  end

  test "should update alert" do
    put :update, :id => alerts(:one).to_param, :alert => { }
    assert_redirected_to alert_path(assigns(:alert))
  end

  test "should destroy alert" do
    assert_difference('Alert.count', -1) do
      delete :destroy, :id => alerts(:one).to_param
    end

    assert_redirected_to alerts_path
  end
end
