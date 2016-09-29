class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.belongs_to :period, index: true, foreign_key: true
      t.belongs_to :currency, index: true, foreign_key: true
      t.decimal :rate

      t.timestamps null: false
    end
  end
end
