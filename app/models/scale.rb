class Scale < ActiveRecord::Base
  acts_as_taggable 

  has_many :intervals

  def intervals_string
    intervals.by_position.map(&:length).join
  end

  def set_intervals str
    str.
    intervals.by_position.map(&:length).join
  end
  
end
