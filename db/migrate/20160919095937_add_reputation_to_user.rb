class AddReputationToUser < ActiveRecord::Migration
  def change
    add_column :users, :reputation, :integer
  end
end
