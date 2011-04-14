require 'test_helper'

class BlipsControllerTest < ActionController::TestCase
  setup do
    @blip = blips(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:blips)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create blip" do
    assert_difference('Blip.count') do
      post :create, :blip => @blip.attributes
    end

    assert_redirected_to blip_path(assigns(:blip))
  end

  test "should show blip" do
    get :show, :id => @blip.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @blip.to_param
    assert_response :success
  end

  test "should update blip" do
    put :update, :id => @blip.to_param, :blip => @blip.attributes
    assert_redirected_to blip_path(assigns(:blip))
  end

  test "should destroy blip" do
    assert_difference('Blip.count', -1) do
      delete :destroy, :id => @blip.to_param
    end

    assert_redirected_to blips_path
  end
end
