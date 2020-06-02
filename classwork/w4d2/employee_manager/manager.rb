require_relative "employee.rb"

class Manager < Employee 
  
  attr_accessor :employees

    def initialize(name, title, salary, boss=nil, employees = [])
        @employees = employees
        super(name, title, salary, boss)
    end

    def bonus(multiplier)
        total = 0
        @employees.each do |employee|
            if employee.is_a?(Manager)
                employee.employees.each do |emp|
                    total += emp.salary
                end
            end
            total += employee.salary
        end
        total * multiplier
    end

end
