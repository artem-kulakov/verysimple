class AddPeriodToRecord < ActiveRecord::Migration
  def change
    add_reference :records, :period, index: true, foreign_key: true
  end
end
