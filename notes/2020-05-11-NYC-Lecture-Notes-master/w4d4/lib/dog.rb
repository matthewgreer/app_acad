class Dog
  attr_accessor :name

  def initialize(name)
    @name = name
  end


  def encounter_cat(cat)
    if cat.is_friendly?
      raise ImpossibleCat
    else
      run_away
    end
  end

  private 


  def run_away
    "Run #{name} run!"
  end

  def play 
    "*plays*"
  end
end

class ImpossibleCat < RuntimeError
end