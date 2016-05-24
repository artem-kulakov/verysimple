class CreateValues < ActiveRecord::Migration
  def change
    create_table :values do |t|
      t.belongs_to :report, index: true, foreign_key: true
      t.belongs_to :indicator, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
