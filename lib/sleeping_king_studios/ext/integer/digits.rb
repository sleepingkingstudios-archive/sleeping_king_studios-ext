# lib/sleeping_king_studios/ext/integer/digits.rb

class Integer
  # Breaks the number into its component digits in the specified base.
  # 
  # @param [Integer] base The base to use when breaking down the number.
  #
  # @return [Array<String>]
  def digits base = 10
    to_s(base).split ''
  end # method digits
end # class
