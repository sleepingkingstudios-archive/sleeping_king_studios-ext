# SleepingKingStudios::Ext

A collection of extensions to core classes.

## The Extensions

### Object\#metaclass

    require 'sleeping_king_studios/ext/object/metaclass'

Returns the object's metaclass, a Class that holds any functionality specific
to that object instance, e.g. a method defined using
`Object#define_singleton_method`, or a module that the instance extends.

## License

SleepingKingStudios::Ext is released under the
[MIT License](http://www.opensource.org/licenses/MIT).
