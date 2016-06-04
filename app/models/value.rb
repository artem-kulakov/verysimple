class Value < ActiveRecord::Base
  belongs_to :record
  belongs_to :indicator

  def self.amount(record, indicator)
  	where(record_id: record, indicator_id: indicator).first.amount
  end
end
