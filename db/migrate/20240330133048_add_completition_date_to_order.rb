class AddCompletitionDateToOrder < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :order_completion_date, :datetime
  end
end
