class Type < ActiveRecord::Base
	has_many :indicators
	has_many :units
end
