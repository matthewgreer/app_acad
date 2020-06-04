class WrongFoodError < StandardError; end
class NewFriendError < StandardError; end
class NoNameError < StandardError; end
class NoPassTimeError < StandardError; end
# PHASE 2
def convert_to_int(str)
  begin
    Integer(str)
  rescue ArgumentError
    puts "#{str} can't be converted to Integer"
    return nil
  end
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else 
    raise WrongFoodError.new
  end 
end



def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"
  puts "Feed me a fruit! (Enter the name of a fruit:)"
  begin
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)
  rescue WrongFoodError
    if maybe_fruit == "coffee" 
      puts "I don't like coffee. Try again!"
      retry
    else
      puts "Disgusting! I'm out of here"
    end
  end
end  

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
    raise NewFriendError.new("#{@name}, come back when we have known each other for at least 5 years") if yrs_known < 5
    raise NoNameError.new("What is your name again?") if name.length == 0
    raise NoPassTimeError.new("It seems we have nothing in common") if fav_pastime.length == 0
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


