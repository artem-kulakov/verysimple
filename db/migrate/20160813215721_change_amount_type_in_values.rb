class ChangeAmountTypeInValues < ActiveRecord::Migration
  def change
  	change_column :values, :amount,  :decimal
  end
end
