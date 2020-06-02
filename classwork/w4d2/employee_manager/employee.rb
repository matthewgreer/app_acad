class Employee

  attr_reader :salary, :boss

  def initialize(name, title, salary, boss=nil)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
    assign_employee if boss != nil 
  end

  def bonus(multiplier)
    salary * multiplier
  end

  def assign_employee
    boss.employees << self
  end

end

