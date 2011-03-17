class Interval < ActiveRecord::Base
  belongs_to :scale

  validates :position, :presence => true
  validates :length, :presence => true, :numericality => { :greater_than => 0 }
end
