# frozen_string_literal: true

# test/tasks/parse_furniture_test.rb

require "test_helper"
require "rake"

class ParseFurnitureTest < ActiveSupport::TestCase
  def setup
    Rake.application.rake_require("tasks/parse_products")
    Rake::Task.define_task(:environment)
  end

  test "should parse furniture words and save to the database" do
    Rake::Task["products:parse"].invoke

    assert_equal 145, Product.count

    assert Product.exists?(name: "drapes")
    assert Product.exists?(name: "hope chest")
  end

  test "should not save duplicate product names" do
    Rake::Task["products:parse"].invoke

    # Ensure that no duplicates are saved
    assert_equal 145, Product.count
  end
end
