class Company < ActiveRecord::Base
  has_one :record, dependent: :destroy
  validates :name, presence: true, uniqueness: true

  def self.with_record
  	joins(:record).pluck(:company_id)
  end

  def self.with_no_record
		where.not(id: self.with_record).order(:name)
	end
end
