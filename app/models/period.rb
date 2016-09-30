class Period < ActiveRecord::Base
	has_many :records
	has_many :rates
end
