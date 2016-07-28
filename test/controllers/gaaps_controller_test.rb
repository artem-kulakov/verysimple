require 'test_helper'

class GaapsControllerTest < ActionController::TestCase
  setup do
    @gaap = gaaps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gaaps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gaap" do
    assert_difference('Gaap.count') do
      post :create, gaap: { name: @gaap.name }
    end

    assert_redirected_to gaap_path(assigns(:gaap))
  end

  test "should show gaap" do
    get :show, id: @gaap
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gaap
    assert_response :success
  end

  test "should update gaap" do
    patch :update, id: @gaap, gaap: { name: @gaap.name }
    assert_redirected_to gaap_path(assigns(:gaap))
  end

  test "should destroy gaap" do
    assert_difference('Gaap.count', -1) do
      delete :destroy, id: @gaap
    end

    assert_redirected_to gaaps_path
  end
end
