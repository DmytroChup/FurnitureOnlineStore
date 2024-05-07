# frozen_string_literal: true

class CreatePrivateChats < ActiveRecord::Migration[7.1]
  def change
    create_table :private_chats do |t|
      t.references :user, null: false, foreign_key: true
      t.references :producer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
