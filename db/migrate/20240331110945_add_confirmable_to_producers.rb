# frozen_string_literal: true

class AddConfirmableToProducers < ActiveRecord::Migration[7.1]
  def change
    change_table :producers do |t|
      # Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable
    end

    add_index :producers, :confirmation_token, unique: true
  end
end
