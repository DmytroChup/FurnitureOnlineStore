# frozen_string_literal: true

require "test_helper"
# require_relative "../test_helper"

class ProducerTest < ActiveSupport::TestCase
  def setup
    @producer = Producer.new(
      producer_name: "John",
      email:         "john@karazin.ua",
      country:       "Ukraine",
      phone:         "0631111111",
      password:      "password123"
    )
  end

  test "valid producer" do
    assert @producer.valid?
  end

  test "invalid without producer_name" do
    @producer.producer_name = nil
    refute @producer.valid?, "saved producer without a producer_name"
    assert_not_nil @producer.errors[:producer_name], "no validation error for producer_name present"
  end

  test "invalid without email" do
    @producer.email = nil
    refute @producer.valid? "saved producer without an email"
    assert_not_nil @producer.errors[:email]
  end

  test "invalid without country" do
    @producer.country = nil
    assert_not @producer.valid?, "producer is valid without a country"
    assert_not_nil @producer.errors[:country]
  end

  test "invalid without phone" do
    @producer.phone = nil
    assert_not @producer.valid?, "producer is valid without a phone"
    assert_not_nil @producer.errors[:phone]
  end

  test "invalid with invalid email domain" do
    @producer.email = "john@gmail.com"
    assert_not @producer.valid?, "producer is valid with invalid email domain"
    assert_not_nil @producer.errors[:email]
  end

  test "invalid with invalid phone format" do
    @producer.phone = "12345"
    assert_not @producer.valid?, "producer is valid with invalid phone format"
    assert_not_nil @producer.errors[:phone]
  end

  test "invalid with short password" do
    @producer.password = "pass"
    assert_not @producer.valid?, "producer is valid with short password"
    assert_not_nil @producer.errors[:password]
  end
end
