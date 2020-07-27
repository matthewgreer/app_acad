module Walkable
  def walk
    puts "*#{name} is walking*"
  end
end

class Animal
  def initialize(name)
    @name = name
  end

  def walk
    # puts "*#{name} is walking*"
    puts "I will never do anything"
  end

  def eat(food)
    puts "*#{name} eats the #{food}*"
  end
end
# pry(main)> Dog.ancestors # lists inheritance chain
# => [Dog, Animal, Object, PP::ObjectMixin, Kernel, BasicObject]

class Dog < Animal # Animal = super-class, Dog = sub-class
  include Walkable
  # include Enumerable
  # def initialize(name)
  #   @name = name
  # end

  def introduce
    puts "#{name} bork bork"
  end

  def fetch(item)
    puts "*#{name} excitedly fetches #{item} and wants you to throw it again*"
  end

  def eat(food)
    puts "*#{self.name}, the dog, eats the #{food}*"
  end

  def walk(location = "park")
    super()
    # super # implies super(location)
    puts "and they enjoyed walking to #{location} :)"
  end

  def sniff(other_dog)
    puts "*#{name} sniffs #{other_dog.name}'s butt. interesting.*"
  end

  protected
  attr_reader :name

  # def name # long-hand reader
  #   @name
  # end
  
end

class Cat < Animal
  include Walkable

  # def initialize(name)
  #   @name = name
  # end

  def introduce
    puts "#{name} meow"
  end

  # def walk
  #   puts "*#{name} is walking*"
  # end

  # def eat(food)
  #   puts "*#{name} eats the #{food}*"
  # end

  private
  attr_reader :name
end


class Robot
  include Walkable

  def initialize(name)
    @name = name
  end

  # def walk
  #   puts "*#{name} is walking*"
  # end

  private
  attr_reader :name

end
