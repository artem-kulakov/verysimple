class AddIndustryToCompany < ActiveRecord::Migration
  def change
    add_reference :companies, :industry, index: true, foreign_key: true
  end
end
