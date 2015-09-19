class NumericRangeUtils
  def self.range_value_from_position(range, position)
    range_from_zero = shift_range(range, -range.first)

    (range_from_zero.last * position) + range.first
  end

  def self.range_position_from_value(range, value)
    value_from_zero = value - range.first
    range_from_zero = shift_range range, -range.first

    value_from_zero / range_from_zero.last.to_f
  end

  def self.shift_range(range, shift)
    (range.first + shift)..(range.last + shift)
  end

  # value is to old_range as the returned value is to new_range, eg.
  # shift_proportions(5, 0..10, 0..100) #=> 50
  # shift_proportions(5.0, 0..-10, 0..100) #=> -50.0
  def self.shift_proportions(value, old_range, new_range)
    ret = range_value_from_position(new_range, range_position_from_value(old_range, value))
    ret = ret.to_i if value.class == Fixnum
    ret
  end

end

