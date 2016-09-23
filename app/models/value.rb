class Value < ActiveRecord::Base
  belongs_to :record
  belongs_to :indicator
  belongs_to :unit

  def self.amount(record, indicator)
  	value = where(record_id: record, indicator_id: indicator)
  	if value.any? and not value.first.amount.nil?
  		value.first.amount * value.first.unit.multiplier
  	else
  		nil
  	end
  end

end
