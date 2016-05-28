class Value < ActiveRecord::Base
  belongs_to :report
  belongs_to :indicator

  def self.amount(report, indicator)
  	where(report_id: report, indicator_id: indicator).first.amount
  end
end
