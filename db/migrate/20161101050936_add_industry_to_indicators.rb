class AddIndustryToIndicators < ActiveRecord::Migration
  def change
    add_reference :indicators, :industry, index: true, foreign_key: true
  end
end
