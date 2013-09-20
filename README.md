# SleepingKingStudios::Ext

A collection of extensions to core classes.

## The Extensions

### Array\#fold

    require 'sleeping_king_studios/ext/array/fold'

Loops through the items in the array and counts the number of times each item
appears. If a block is provided, each item is passed into the block, and the
result of yielding the block is counted instead.

_Example:_ Find the number of times each item appears in the array.

    items  = %w(foo foo foo bar bar baz wibble wobble)
    items.fold
    #=> { 'foo' => 3, 'bar' => 2, 'baz' => 1, 'wibble' => 1, 'wobble' => 1 }

_Example:_ Count the items in the array with each status value.

    class SampleItem < Struct.new(:status); end
    items = [
      SampleItem.new :approved,
      SampleItem.new :rejected,
      SampleItem.new :approved,
      SampleItem.new :approved,
      SampleItem.new :error,
      SampleItem.new nil,
      SampleItem.new :rejected,
    ] # end array
    items.fold { |item| item.status }
    #=> { :approved => 3, :rejected => 2, :error => 1, nil => 1 }

### Object\#metaclass

    require 'sleeping_king_studios/ext/object/metaclass'

Returns the object's metaclass, a Class that holds any functionality specific
to that object instance, e.g. a method defined using
`Object#define_singleton_method`, or a module that the instance extends.

## License

SleepingKingStudios::Ext is released under the
[MIT License](http://www.opensource.org/licenses/MIT).
