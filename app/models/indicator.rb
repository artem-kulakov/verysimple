class Indicator < ActiveRecord::Base
  has_many :values, dependent: :destroy
  belongs_to :type
end
