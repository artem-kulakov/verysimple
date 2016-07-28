class AddGaapToRecord < ActiveRecord::Migration
  def change
    add_reference :records, :gaap, index: true, foreign_key: true
  end
end
