class CreateProducers < ActiveRecord::Migration[7.1]
  def change
    create_table :producers do |t|
      t.integer :producer_id
      t.string :producer_name
      t.string :country
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
