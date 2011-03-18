module ScalesHelper
  def note num
    num = num % Scale::NOTES_BY_POSITION.keys.size
    raise( ArgumentError, "Unknown note number: #{num.inspect}") unless Scale::NOTES_BY_POSITION.keys.include?( num  )
    Scale::NOTES_BY_POSITION[num]
  end
end
