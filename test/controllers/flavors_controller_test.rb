require 'test_helper'

class FlavorsControllerTest < ActionController::TestCase
  setup do
    @flavor = flavors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:flavors)
  end

  test "should create flavor" do
    assert_difference('Flavor.count') do
      post :create, flavor: { beer_id: @flavor.beer_id, name: @flavor.name, rating: @flavor.rating, user_id: @flavor.user_id }
    end

    assert_response 201
  end

  test "should show flavor" do
    get :show, id: @flavor
    assert_response :success
  end

  test "should update flavor" do
    put :update, id: @flavor, flavor: { beer_id: @flavor.beer_id, name: @flavor.name, rating: @flavor.rating, user_id: @flavor.user_id }
    assert_response 204
  end

  test "should destroy flavor" do
    assert_difference('Flavor.count', -1) do
      delete :destroy, id: @flavor
    end

    assert_response 204
  end
end
