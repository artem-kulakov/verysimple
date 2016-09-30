class Value < ActiveRecord::Base
  belongs_to :record
  belongs_to :indicator
  belongs_to :unit

  def self.amount(record_id, indicator_id, target_currency_id)
  	value = where(record_id: record_id, indicator_id: indicator_id).first
  	unless value.amount.nil?
      if value.unit.type.name == 'currency'
        original_currency_id = Currency.where(code: value.unit.name).pluck(:id).first
        original_to_usd = Rate.where(period_id: value.record.period_id, currency_id: original_currency_id).pluck(:rate).first
        usd_to_target = Rate.where(period_id: value.record.period_id, currency_id: target_currency_id).pluck(:rate).first
        value.amount / original_to_usd * usd_to_target
      else
  		  value.amount * value.unit.multiplier
      end
  	else
  		nil
  	end
  end

end
