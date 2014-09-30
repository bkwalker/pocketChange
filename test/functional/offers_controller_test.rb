require 'test_helper'

class OffersControllerTest < ActionController::TestCase
  setup do
    @offer = offers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:offers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create offer" do
    assert_difference('Offer.count') do
      post :create, offer: { accepted: @offer.accepted, active: @offer.active, amount: @offer.amount, counter_amount: @offer.counter_amount, delivery_method: @offer.delivery_method, item_id: @offer.item_id, payment_method: @offer.payment_method, pickup_time: @offer.pickup_time, user_id: @offer.user_id }
    end

    assert_redirected_to offer_path(assigns(:offer))
  end

  test "should show offer" do
    get :show, id: @offer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @offer
    assert_response :success
  end

  test "should update offer" do
    put :update, id: @offer, offer: { accepted: @offer.accepted, active: @offer.active, amount: @offer.amount, counter_amount: @offer.counter_amount, delivery_method: @offer.delivery_method, item_id: @offer.item_id, payment_method: @offer.payment_method, pickup_time: @offer.pickup_time, user_id: @offer.user_id }
    assert_redirected_to offer_path(assigns(:offer))
  end

  test "should destroy offer" do
    assert_difference('Offer.count', -1) do
      delete :destroy, id: @offer
    end

    assert_redirected_to offers_path
  end
end
