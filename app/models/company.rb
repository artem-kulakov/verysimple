class Company < ActiveRecord::Base
  has_one :record, dependent: :destroy
  belongs_to :user
  belongs_to :industry
  validates :name, presence: true, uniqueness: true

  def self.without_records(industry_id, period_id, gaap_id)
  	with_records = self.joins(:record).where(records: {period_id: period_id, gaap_id: gaap_id}).pluck(:company_id)
		where(industry_id: industry_id).where.not(id: with_records).order(:name)
	end
end
