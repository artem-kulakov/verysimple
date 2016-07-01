class Value < ActiveRecord::Base
  belongs_to :record
  belongs_to :indicator

  def self.amount(record, indicator)
  	value = where(record_id: record, indicator_id: indicator)
  	
  	if value.any?
  		value.first.amount
  	else
  		nil
  	end
  end

end
