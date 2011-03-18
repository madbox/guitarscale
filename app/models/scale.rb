class Scale < ActiveRecord::Base
  acts_as_taggable 

  has_many :intervals

  def intervals_string
    intervals.order( :position ).map(&:length).join
  end

  def notes_pattern
    intervals.order( :position ).map(&:length).inject([0]){|s,i| [s, s.flatten.last + i]}.flatten
  end

  def set_intervals array
    raise( ArgumentError, 'Array of Numeric expected' ) if array.size < 1 && array.select{ |el| ! el.kind_of?( Numeric )}.size > 0

    intervals.destroy_all

    array.each_with_index do |el, i|
      intervals << Interval.create( :position => i, :length => el  )
    end
  end
end
