require 'byebug'
class WrongPasswordError < StandardError; end # one line class
class OtherErrorToRescue < StandardError; end

def enter_password
  puts "whats the password?"

  ### TODO: Add logic to handle a raised error here
  begin
    get_input # since this is where we call `get_input`, this is where we can rescue it from 
  rescue WrongPasswordError => e  # this will not rescue any type of errors now
    # debugger
    puts e.message 
    retry
  rescue OtherErrorToRescue
    puts "other error message"
  ensure 
    puts "This code is run everytime" # this will run if we hit an error or not
  end
  

  puts "thanks!"
end

def get_input
  input = gets.chomp
  echo_input(input)

  ### TODO: Add logic to raise an error unless password is 'starwars'
  raise WrongPasswordError.new("Wrong Password!") unless input == "starwars" 
  # this error gets rescued in the `enter_password` method
  # so we won't see it printed to the terminal (unless we specifically call on it with e.message)
end

def echo_input(input)
  puts 3 * input # This will cause TypeError
end

enter_password
