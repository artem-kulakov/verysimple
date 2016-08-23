class AddTypeToIndicator < ActiveRecord::Migration
  def change
    add_reference :indicators, :type, index: true, foreign_key: true
  end
end
