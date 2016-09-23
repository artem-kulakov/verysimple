class AddRewardToRecord < ActiveRecord::Migration
  def change
    add_column :records, :reward, :integer
    add_reference :records, :user, index: true, foreign_key: true
  end
end
