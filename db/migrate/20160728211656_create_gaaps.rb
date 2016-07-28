class CreateGaaps < ActiveRecord::Migration
  def change
    create_table :gaaps do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
