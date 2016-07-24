class CreatePeriods < ActiveRecord::Migration
  def change
    create_table :periods do |t|
      t.date :ending

      t.timestamps null: false
    end
  end
end
