require 'byebug'

class String 
    def reverse
      # start a new string
      new_str = ""
      # go through the word backwords
      i = self.length - 1
      while i >= 0
      # add each letter to the new string
        new_str += self[i]
        i -= 1
      end
      return new_str
    end
end

# metaprogramming: writing code that defines other code's behavior (writing code that 'writes code')
# useful for dynamic programming (e.g. ActiveRecord 'magic')

class Dog
  puts self # 1 what is self? -> Dog (inside the definition of the class, same as the line below)
  
  def self.who_am_i?
    puts self # 2 what is self? -> Dog (inside a class method)
  end
  
  def who_am_i?
    puts self # 3 what is self? -> an instance of Dog (e.g. fido)
  end
  
  # classes are instances of the 'Class' class
  # so classes can have instance variables that are defined on the class itself
  # these class instance variables will be available to all instances of the class
  
  def self.all_dogs
    @all_dogs # this is a class instance variable
  end

  def self.record_dog_birth(dog) # called every time a dog is (initialized)
    @all_dogs ||= []
    @all_dogs << dog # mutates the class instance variable
  end
  
  attr_reader :name

  def initialize(name)
    @name = name # this is an instance variable for an instance of the Dog class
    @secret = "Goat in disguise"
    self.class.record_dog_birth(self) # calls the class method that mutates the class instance variable @all_dogs
  end

  # def sleep
  #   puts "sleeping"
  # end

  # def eat
  #   puts "eating"
  # end

  # def drink
  #   puts "drinking"
  # end

  # metaprogram the above methods: 
  # go through the list of method names
  # define a method with the given name
  # puts that name + 'ing'

  def self.create_tricks(*tricks)
    # 1 what is self? -> Dog (inside of class method)
    tricks.each do |trick_name|
      # 2 what is self? -> Dog (still inside class method)
      define_method(trick_name) do
        # 3 what is self? -> instance of Dog (this is the code inside of the instance method that we are defining)
        puts "#{trick_name}ing"
      end
    end
  end

  def juggle(thing, num)
    num.times do
      puts "juggling #{thing}"
    end
  end

  def do_this_then_that(this, that)
    self.send(this)
    self.send(that)
  end

  private

  attr_reader :secret

  def tell_secret
    puts "My secret is: #{@secret}"
  end
end


# instance_variable_set
# instance_variable_get
  # we can use these to write dynamic code to access instance variables
  # toby = Dog.new("Toby")
  # variable = 'name'
  # toby.instance_variable_get("@#{variable}") -> "Toby"
  # toby.instance_variable_set('@secret', "I am a sheep in dog's clothing")

  
# send allows us to dynamically call methods
  # we can even pass in arguments for the method that we are sending
  # toby.send('juggle', 'bowling pins', 5)

# define_method allows us to dynamically define instance methods (see line 74)


# Today's project
# 1. It's difficult and mind-bending, even frustrating at times - DO NOT look at the solutions before 6pm

# 2. Use the strategy we discussed of psuedocoding the human steps, e.g.

def self.my_attr_reader(ivar)
  # take the name given
  # define a method with the given name
  # have that method return the instance variable with that name
end