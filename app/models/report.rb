class Report < ActiveRecord::Base
  belongs_to :company

  def company_name
  	company.name
  end
end
