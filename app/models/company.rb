class Company < ActiveRecord::Base
  has_one :record, dependent: :destroy
  validates :name, presence: true, uniqueness: true

  def self.with_record(period, gaap)
  	# joins(:record).pluck(:company_id)
  	joins(:record).where(:records => {period_id: period, gaap_id: gaap}).pluck(:company_id)
  end

  def self.with_no_record(period, gaap)
		where.not(id: self.with_record(period, gaap)).order(:name)
	end
end
