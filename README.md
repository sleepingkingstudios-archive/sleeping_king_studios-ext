# SleepingKingStudios::Ext

A collection of extensions to core classes.

YARD documentation is available at
[RubyDoc.info](http://rubydoc.info/github/sleepingkingstudios/sleeping_king_studios-ext).

## Deprecation Notice

This project has been deprecated in favor of [SleepingKingStudios::Tools](https://github.com/sleepingkingstudios/sleeping_king_studios-tools), and is no longer maintained.

## The Extensions

### Array\#fold

    require 'sleeping_king_studios/ext/array/fold'

Loops through the items in the array and counts the number of times each item
appears. If a block is provided, each item is passed into the block, and the
result of yielding the block is counted instead.

_Example:_ Find the number of times each item appears in the array.

    items = %w(foo foo foo bar bar baz wibble wobble)
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

### Integer\#digits

    require 'sleeping_king_studios/ext/integer/digits'

Breaks the number into its component digits in the specified base.

_Example:_ Get the digits of a number in base 10.

    23154.digits
    #=> ['2', '3', '1', '5', '4']

_Example:_ Get the digits of a number in base 2.

    80.digits(2)
    #=> ['1', '0', '1', '0', '0', '0', '0']

_Example:_ Get digits of a number in base 16.

    3894.digits(16)
    #=> ['f', '3', '6']

### Integer\#romanize

    require 'sleeping_king_studios/ext/integer/romanize'

Returns the value as a string of Roman numerals, i.e. the number 7 becomes the
string "VII". The number must be greater than 0 and less than 5000.

_Example:_ Get the number's representation in Roman numerals.

    7.romanize
    #=> 'VII'

    18.romanize
    #=> 'XVIII'

    49.romanize
    #=> 'XLIX'

    3894.romanize
    #=> 'MMMDCCCXCIV'

#### Additive

If the additive flag is set to true, uses the form 'IIII' for 4 and 'VIIII'
for 9, as well instead of 'IV' and 'IX', respectively. Also applies to the tens
and hundreds places, e.g. 40, 90, 400, and 900.

_Example:_ Get the number's representation in additive Roman numerals.

    499.romanize :additive => true
    #=> 'CCCCLXXXXVIIII'

### Object\#metaclass

    require 'sleeping_king_studios/ext/object/metaclass'

Returns the object's metaclass, a Class that holds any functionality specific
to that object instance, e.g. a method defined using
`Object#define_singleton_method`, or a module that the instance extends.

## License

SleepingKingStudios::Ext is released under the
[MIT License](http://www.opensource.org/licenses/MIT).
