# frozen_string_literal: true

require "application_system_test_case"

class PaymentHistoriesTest < ApplicationSystemTestCase
  setup do
    @payment_history = payment_histories(:one)
  end

  test "visiting the index" do
    visit payment_histories_url
    assert_selector "h1", text: "Payment histories"
  end

  test "should create payment history" do
    visit payment_histories_url
    click_on "New payment history"

    fill_in "Amount", with: @payment_history.amount
    fill_in "Payment date", with: @payment_history.payment_date
    fill_in "Payment", with: @payment_history.payment_id
    fill_in "Payment method", with: @payment_history.payment_method
    fill_in "User", with: @payment_history.user_id
    click_on "Create Payment history"

    assert_text "Payment history was successfully created"
    click_on "Back"
  end

  test "should update Payment history" do
    visit payment_history_url(@payment_history)
    click_on "Edit this payment history", match: :first

    fill_in "Amount", with: @payment_history.amount
    fill_in "Payment date", with: @payment_history.payment_date
    fill_in "Payment", with: @payment_history.payment_id
    fill_in "Payment method", with: @payment_history.payment_method
    fill_in "User", with: @payment_history.user_id
    click_on "Update Payment history"

    assert_text "Payment history was successfully updated"
    click_on "Back"
  end

  test "should destroy Payment history" do
    visit payment_history_url(@payment_history)
    click_on "Destroy this payment history", match: :first

    assert_text "Payment history was successfully destroyed"
  end
end
