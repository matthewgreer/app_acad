class Fish
  @@all_fish = [] # class variable

  # Class methods
  def self.all_fish
    @@all_fish
  end

  # utility method
  def self.random_state_of_being
    [true, false].sample
  end

  # Factory methods - create instances of a class
  def self.make_nemo
    Fish.new("Nemo", Fish.random_state_of_being)
  end

  def self.make_random_fish
    name = ""
    5.times do
      name << ('a'..'z').to_a.sample
    end

    Fish.new(name, Fish.random_state_of_being)
  end

  # attr_reader :name
  # attr_writer :name
  attr_accessor :name


  # Instance methods
  def initialize(name, lost)
    @name = name
    @lost = lost

    @@all_fish << self # `self` refers to the Fish instance that we are creating
  end

  # manually define getters
  # def name
  #   @name
  # end

  def lost?
    @lost
  end

  # manually define setters
  def name=(new_name)
    @name = new_name
  end

  def find  # no arg (this isn't a traditional setter method)
    @lost = false
  end
end








################################################################################################

# misc notes


# if condition
#   puts "true"
# else
#   puts "false"
# end

# ternary:
# condition | what to evaluate if condition is true | what to evaluate if condition is false
# condition ? puts "true" : puts "false"