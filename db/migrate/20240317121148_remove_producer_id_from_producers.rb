# frozen_string_literal: true

class RemoveProducerIdFromProducers < ActiveRecord::Migration[7.1]
  def change
    remove_column :producers, :producer_id, :integer
  end
end
