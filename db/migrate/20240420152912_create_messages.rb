class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|
      t.string :content
      t.references :private_chat, null: false, foreign_key: true
      t.references :profile, polymorphic: true, null: false

      t.timestamps
    end
  end
end
