class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.belongs_to :company, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
