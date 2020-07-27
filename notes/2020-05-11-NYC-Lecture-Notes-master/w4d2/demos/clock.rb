# No abstraction, bad! 

sec = 0
min = 0
hrs = 0

def tick(sec, min, hrs)
    sec += 1
    if sec == 60
        sec = 0
        min += 1
    end
    if min == 60
        min = 0 
        hrs += 1
    end
    hrs = 0
    return [sec, min, hrs]
end

def print(sec, min, hrs)
    puts "#{hrs}:#{min}:#{sec}"
end

# while true
#     sleep(1)
#     print(sec, min, hrs)
#     new_time = tick(sec, min, hrs)
#     sec = new_time[0]
#     mins = new_time[1]
#     hrs = new_time[2]
# end




# Abstraction, good!

class Clock
    attr_accessor :min, :hrs
    attr_reader :sec

    def initialize(sec = 0, min = 0, hrs = 0)
        @sec = sec
        @min = min
        @hrs = hrs
    end

    # public api
    def run
        while true 
            sleep(1) # stop execution for 1 second
            tick # calling it implicitly
            # self.tick # can't call it explicitly
            # calling method on self is just like calling a public method on an instance, so privacy will stop you from calling the method.
            # system("clear") # for clearing terminal output
            print
        end
    end
    
    def print
        puts "#{self.hrs}:#{self.min}:#{self.sec}"
    end

    private
    attr_writer :sec
    # private api
    def tick
        self.sec += 1 # self.sec = self.sec + 1
        # sec = sec + 1
        # sec += 1 # ruby treats this as local variable
        increment_min
        increment_hrs
    end
    
    def increment_min
        if self.sec == 60
            self.min += 1
            self.sec = 0 
        end
    end

    def increment_hrs
        if self.min == 60
            self.hrs += 1
            self.min = 0 
        end
    end

end

# ny_clock = Clock.new(0, 17, 10)
# ny_clock.run
# Clock.new.run

