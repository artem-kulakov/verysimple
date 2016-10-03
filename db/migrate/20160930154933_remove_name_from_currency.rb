class RemoveNameFromCurrency < ActiveRecord::Migration
  def change
    remove_column :currencies, :name
  end
end
