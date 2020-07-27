require 'faker'

class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  # builds a profile on a cat
  def assess
    @score = rand(10) # random score from 0 to 10
    sleep(0.5)
  end

  # determines viability of other_cat as a pawtner.
  def compare(other_cat)
    sleep(0.05)
  end
end

def cat_compatibility_algorithm(all_cats)
  puts "Assessing cats..."

  before_assessment_time = Time.now
  all_cats.each { |cat| cat.assess }

  puts "Catssessments completed in #{(Time.now - before_assessment_time)}s"

  puts "Comparing cats..."
  before_compare_time = Time.now
  # what's the time complexity of this comparison algo
  # O(n^2)?
  all_cats.each_with_index do |cat_1, idx_1| # O(n)
    # all_cats.each do |cat_2| # O(n)
    #   next if cat_1 == cat_2
    #   we are comparing itself n times

    # all_cats.each_with_index do |cat_2, idx_2| # O(n/2)
    #   next if cat_1 == cat_2 || idx_2 > idx_1

    all_cats[idx_1..-1].each do |cat_2| # O(n/2)
      next if cat_1 == cat_2
      cat_1.compare(cat_2)
    end
  end # O(n * n/2) == O(n^2/2) => O(n^2) <- dominant term


  puts "Cat comparisons completed in #{(Time.now - before_compare_time)}s"
end

def generate_cats(num_cats)
  cats = []
  num_cats.times do
    cats << Cat.new(Faker::Creature::Cat.name)
  end
  cats
end




puts <<~'HEREDOC'
      /$$$$$$  /$$        /$$$$$$              /$$               /$$
    /$$__  $$| $$       /$$__  $$            | $$              |__/
    | $$  \ $$| $$   /$$| $$  \__/  /$$$$$$  /$$$$$$   /$$$$$$$  /$$  /$$$$$$
    | $$  | $$| $$  /$$/| $$       |____  $$|_  $$_/  | $$__  $$| $$ /$$__  $$
    | $$  | $$| $$$$$$/ | $$        /$$$$$$$  | $$    | $$  \ $$| $$| $$  \ $$
    | $$  | $$| $$_  $$ | $$    $$ /$$__  $$  | $$ /$$| $$  | $$| $$| $$  | $$
    |  $$$$$$/| $$ \  $$|  $$$$$$/|  $$$$$$$  |  $$$$/| $$  | $$| $$| $$$$$$$/
    \______/ |__/  \__/ \______/  \_______/   \___/  |__/  |__/|__/| $$____/
                                                                  | $$
                                                                  | $$
                                                                  |__/
    HEREDOC


cats = generate_cats(20)

print "Today's candidates are: "
puts cats.map(&:name).join(", ")
print "\n"

cat_compatibility_algorithm(cats)