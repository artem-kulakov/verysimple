class Unit < ActiveRecord::Base
  belongs_to :section
  belongs_to :type
  has_many :values
end
