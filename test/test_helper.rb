# frozen_string_literal: true

ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors, with: :threads)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all
    #fixtures :reviews, :users, :products
    #fixtures :subcategories, :categories
    #fixtures :orders, :order_items, :payment_histories, :products, :users
    # Add more helper methods to be used by all tests here...
  end
end
