class Rate < ActiveRecord::Base
  belongs_to :period
  belongs_to :currency
end
