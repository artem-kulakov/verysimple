class Value < ActiveRecord::Base
  belongs_to :report
  belongs_to :indicator
end
