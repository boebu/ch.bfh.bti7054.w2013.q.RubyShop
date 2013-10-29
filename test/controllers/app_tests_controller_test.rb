require 'test_helper'

class AppTestsControllerTest < ActionController::TestCase
  setup do
    @app_test = app_tests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:app_tests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create app_test" do
    assert_difference('AppTest.count') do
      post :create, app_test: { name: @app_test.name }
    end

    assert_redirected_to app_test_path(assigns(:app_test))
  end

  test "should show app_test" do
    get :show, id: @app_test
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @app_test
    assert_response :success
  end

  test "should update app_test" do
    patch :update, id: @app_test, app_test: { name: @app_test.name }
    assert_redirected_to app_test_path(assigns(:app_test))
  end

  test "should destroy app_test" do
    assert_difference('AppTest.count', -1) do
      delete :destroy, id: @app_test
    end

    assert_redirected_to app_tests_path
  end
end
