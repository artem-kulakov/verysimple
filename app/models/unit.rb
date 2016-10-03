class Unit < ActiveRecord::Base
  belongs_to :type
  has_many :values
end
