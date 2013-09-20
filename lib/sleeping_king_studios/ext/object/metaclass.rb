# lib/sleeping_king_studios/ext/object/metaclass.rb

class Object
  # Returns the object's metaclass, a Class that holds any functionality
  # specific to that object instance, e.g. a method defined using
  # Object#define_singleton_method, or a module that the instance extends.
  # 
  # @return [Class] The object's metaclass.
  # 
  # @since 0.1.0
  def metaclass
    class << self; self; end
  end # method metaclass
end # class
