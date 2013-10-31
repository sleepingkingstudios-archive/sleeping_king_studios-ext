# lib/sleeping_king_studios/ext/integer/romanize.rb

require 'sleeping_king_studios/ext/integer/digits'

class Integer
  # Minimum allowed value for the #romanize method.
  ROMANIZE_MIN = 1

  # Maximum allowed value for the #romanize method.
  ROMANIZE_MAX = 4999

  # Returns the value as a string of Roman numerals. The number must be greater
  # than 0 and less than 5000 (numbers between 4000 and 4999 are represented by
  # the string MMMM in the thousands place).
  #
  # @param [Hash] options The romanization options.
  # @option options [Boolean] additive If true, uses the structure IIII for 4
  #   and the VIIII structure for 9 instead of IV and IX, respectively. Also
  #   applies to the tens and hundreds places, e.g. 40, 90, 400, etc (the
  #   thousands place is always additive).
  #
  # @return [String] The Roman numerals.
  # 
  # @raise [RangeError] If the number is too large or too small to represent
  #   using Roman numerals.
  def romanize options = {}
    unless (ROMANIZE_MIN..ROMANIZE_MAX).include? self
      raise RangeError.new "integer to romanize must be within range #{ROMANIZE_MIN} to #{ROMANIZE_MAX}"
    end # unless

    rules = [
      '',
      '%one',
      '%one%one',
      '%one%one%one',
      '%one%five',
      '%five',
      '%five%one',
      '%five%one%one',
      '%five%one%one%one',
      '%one%ten',
      '%ten'
    ] # end array rules

    if Hash === options && options.fetch(:additive, false)
      rules[4] = '%one%one%one%one'
      rules[9] = '%five%one%one%one%one'
    end # if

    numerals = [
      %w(I V X),
      %w(X L C),
      %w(C D M),
      ['M', 'MMM', '']
    ] # end array numerals

    digits.reverse.map.with_index do |digit, index|
      rules[digit.to_i]
        .gsub('%one',  numerals[index][0])
        .gsub('%five', numerals[index][1])
        .gsub('%ten',  numerals[index][2])
    end.reverse.join ''
  end # method romanize
end # class
