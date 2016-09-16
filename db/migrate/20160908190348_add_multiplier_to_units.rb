class AddMultiplierToUnits < ActiveRecord::Migration
  def change
    add_column :units, :multiplier, :decimal
  end
end
