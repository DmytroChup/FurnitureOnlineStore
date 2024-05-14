# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.integer :user_id
      t.string :user_role
      t.string :first_name
      t.string :patronymic
      t.string :last_name
      t.string :phone
      t.string :username
      t.string :password
      t.integer :cart_id

      t.timestamps
    end
  end
end
