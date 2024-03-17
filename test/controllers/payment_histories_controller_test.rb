require "test_helper"

class PaymentHistoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @payment_history = payment_histories(:one)
  end

  test "should get index" do
    get payment_histories_url
    assert_response :success
  end

  test "should get new" do
    get new_payment_history_url
    assert_response :success
  end

  test "should create payment_history" do
    assert_difference("PaymentHistory.count") do
      post payment_histories_url, params: { payment_history: { amount: @payment_history.amount, payment_date: @payment_history.payment_date, payment_method: @payment_history.payment_method, user_id: @payment_history.user_id } }
    end

    assert_redirected_to payment_history_url(PaymentHistory.last)
  end

  test "should show payment_history" do
    get payment_history_url(@payment_history)
    assert_response :success
  end

  test "should get edit" do
    get edit_payment_history_url(@payment_history)
    assert_response :success
  end

  test "should update payment_history" do
    patch payment_history_url(@payment_history), params: { payment_history: { amount: @payment_history.amount, payment_date: @payment_history.payment_date, payment_method: @payment_history.payment_method, user_id: @payment_history.user_id } }
    assert_redirected_to payment_history_url(@payment_history)
  end

  test "should destroy payment_history" do
    assert_difference("PaymentHistory.count", -1) do
      delete payment_history_url(@payment_history)
    end

    assert_redirected_to payment_histories_url
  end
end
