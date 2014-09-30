require 'test_helper'

class LocationAddressesControllerTest < ActionController::TestCase
  setup do
    @location_address = location_addresses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:location_addresses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create location_address" do
    assert_difference('LocationAddress.count') do
      post :create, location_address: { city: @location_address.city, location_id: @location_address.location_id, state: @location_address.state, street: @location_address.street, zip: @location_address.zip }
    end

    assert_redirected_to location_address_path(assigns(:location_address))
  end

  test "should show location_address" do
    get :show, id: @location_address
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @location_address
    assert_response :success
  end

  test "should update location_address" do
    put :update, id: @location_address, location_address: { city: @location_address.city, location_id: @location_address.location_id, state: @location_address.state, street: @location_address.street, zip: @location_address.zip }
    assert_redirected_to location_address_path(assigns(:location_address))
  end

  test "should destroy location_address" do
    assert_difference('LocationAddress.count', -1) do
      delete :destroy, id: @location_address
    end

    assert_redirected_to location_addresses_path
  end
end
