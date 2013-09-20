# lib/sleeping_king_studios/ext/array/fold.rb

class Array
  # Loops through the items in the array and counts the number of times each
  # item appears. If a block is provided, each item is passed into the block,
  # and the result of yielding the block is counted instead.
  # 
  # @return [Hash] A hash whose keys are the items in the
  #   array or the results of yielding the block, and whose values are the
  #   number of times each item appeared in the array.
  # 
  # @example Find the number of times each item appears in the array.
  #   
  #   items  = %w(foo foo foo bar bar baz wibble wobble)
  #   items.fold
  #   #=> { 'foo' => 3, 'bar' => 2, 'baz' => 1, 'wibble' => 1, 'wobble' => 1 }
  # 
  # @example Count the items in the array with each status value.
  # 
  #   class SampleItem < Struct.new(:status); end
  #   items = [
  #     SampleItem.new :approved,
  #     SampleItem.new :rejected,
  #     SampleItem.new :approved,
  #     SampleItem.new :approved,
  #     SampleItem.new :error,
  #     SampleItem.new nil,
  #     SampleItem.new :rejected,
  #   ] # end array
  #   items.fold { |item| item.status }
  #   #=> { :approved => 3, :rejected => 2, :error => 1, nil => 1 }
  # 
  # @since 0.1.0
  def fold
    each.with_object({}) do |item, hsh|
      value = block_given? ? yield(item) : item
      hsh[value] = hsh.fetch(value, 0) + 1
    end # each with object
  end # method fold
end # class
