class Scale < ActiveRecord::Base
  acts_as_taggable 

  has_many :intervals

  attr_accessor :intervals_string

  DEFAULT_TUNING = [4,11,7,2,9,4]

  NOTES_BY_POSITION = { 
    0 => 'C',
    1 => 'C#',
    2 => 'D',
    3 => 'D#',
    4 => 'E',
    5 => 'F',
    6 => 'F#',
    7 => 'G',
    8 => 'G#',
    9 => 'A',
   10 => 'A#',
   11 => 'B'
  }

  def before_validation
    if @intervals_string.match(/^\d+$/)
      set_intervals @intervals_string.split('').map{ |char| char.to_i }
    end
  end

  def intervals_string
    intervals.order( :position ).map(&:length).join
  end

  def notes_pattern root_note = 0
    raise( ArgumentError, "Numeric expected in root_note, got: #{root_note.inspect}" ) unless root_note.is_a?( Numeric )

    @notes_patterns ||= { }
    return @notes_patterns[root_note] if @notes_patterns.has_key?( root_note )

    pattern = intervals.order( :position ).map(&:length).inject([0]){|s,i| [s, s.flatten.last + i ]}.flatten
    pattern.each_with_index{ |el, i| pattern[i] = ( el + root_note ) % Scale::NOTES_BY_POSITION.keys.size }

    @notes_patterns[root_note] = pattern
  end

  def set_intervals array
    raise( ArgumentError, 'Array of Numeric expected' ) if array.size < 1 && array.select{ |el| ! el.kind_of?( Numeric )}.size > 0

    intervals.destroy_all

    array.each_with_index do |el, i|
      intervals << Interval.create( :position => i, :length => el  )
    end
  end
end
