class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.belongs_to :company, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
