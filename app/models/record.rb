class Record < ActiveRecord::Base
  belongs_to :company
  has_many :values
  accepts_nested_attributes_for :values

	validates :company_id, presence: true

  def company_name
  	company.name
  end
end
