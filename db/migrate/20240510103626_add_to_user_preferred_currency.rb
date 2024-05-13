class AddToUserPreferredCurrency < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :preferred_currency, :string
  end
end
