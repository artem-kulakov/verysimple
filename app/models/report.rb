class Report < ActiveRecord::Base
  belongs_to :company
  has_many :values
  accepts_nested_attributes_for :values

  def company_name
  	company.name
  end
end
