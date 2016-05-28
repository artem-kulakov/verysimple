class AddAmountToValues < ActiveRecord::Migration
  def change
    add_column :values, :amount, :integer
  end
end
