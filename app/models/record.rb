class Record < ActiveRecord::Base
  belongs_to :company
  belongs_to :period
  belongs_to :gaap
  belongs_to :user
  has_many :values, dependent: :destroy
  accepts_nested_attributes_for :values

	validates :company_id, presence: true

  def company_name
  	company.name
  end
end
