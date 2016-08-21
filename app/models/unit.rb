class Unit < ActiveRecord::Base
  belongs_to :section
  belongs_to :type
end
