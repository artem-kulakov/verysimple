class RemoveRewardFromRecords < ActiveRecord::Migration
  def change
    remove_column :records, :reward
  end
end
