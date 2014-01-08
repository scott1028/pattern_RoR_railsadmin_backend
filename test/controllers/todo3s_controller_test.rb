require 'test_helper'

class Todo3sControllerTest < ActionController::TestCase
  setup do
    @todo3 = todo3s(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:todo3s)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create todo3" do
    assert_difference('Todo3.count') do
      post :create, todo3: { label: @todo3.label }
    end

    assert_redirected_to todo3_path(assigns(:todo3))
  end

  test "should show todo3" do
    get :show, id: @todo3
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @todo3
    assert_response :success
  end

  test "should update todo3" do
    patch :update, id: @todo3, todo3: { label: @todo3.label }
    assert_redirected_to todo3_path(assigns(:todo3))
  end

  test "should destroy todo3" do
    assert_difference('Todo3.count', -1) do
      delete :destroy, id: @todo3
    end

    assert_redirected_to todo3s_path
  end
end
