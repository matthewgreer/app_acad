class Cat < ApplicationRecord

    COLORS = %w(brown orange white black blue green)

  include ActionView::Helpers::DateHelper

  # validations

  validates :name, presence: true
  validates :birth_date, presence: true
  validates :color, inclusion: { in: COLORS}
  validates :sex, inclusion: { in: ["M", "F"]}
  # associations



  # instance methods

  def age
    time_ago_in_words(self.birth_date)
  end


end

