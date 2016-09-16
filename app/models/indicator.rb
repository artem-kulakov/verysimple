class Indicator < ActiveRecord::Base
  has_many :values, dependent: :destroy
  belongs_to :type

  def base_unit
  	type.units.where(multiplier: 1).pluck(:name).first
  end
end
