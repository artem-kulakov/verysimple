class AddUnitToValue < ActiveRecord::Migration
  def change
    add_reference :values, :unit, index: true, foreign_key: true
  end
end
