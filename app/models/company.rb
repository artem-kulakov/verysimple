class Company < ActiveRecord::Base
  has_one :record, dependent: :destroy
  belongs_to :user
  validates :name, presence: true, uniqueness: true

  def self.without_records(period_id, gaap_id)
  	with_records = self.joins(:record).where(:records => {period_id: period_id, gaap_id: gaap_id}).pluck(:company_id)
		where.not(id: with_records).order(:name)
	end
end
