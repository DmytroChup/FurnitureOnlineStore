class RemoveEmailFromProducer < ActiveRecord::Migration[7.1]
  def change
    remove_column :producers, :email, :string
  end
end
