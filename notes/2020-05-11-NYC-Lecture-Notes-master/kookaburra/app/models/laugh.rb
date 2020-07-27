# == Schema Information
#
# Table name: laughs
#
#  id         :bigint           not null, primary key
#  body       :string           not null
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Laugh < ApplicationRecord
  validates :body, presence: true
  # validates :author_id, presence: true

  belongs_to :author,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :User

  # how to find location for a laugh?
  has_one :location, # has_one if used here since we don't have a foreign key for a belongs_to direct association
    through: :author,
    source: :location
  
  def self.n_plus_1_print_laugh_and_author
    Laugh.all.each do |laugh| # <= first query to fetch all laughs
      p "#{laugh.body} by #{laugh.author.username}" # <= launches another query to get the author for each laugh
    end
    # results in N + 1 queries hitting out database
    nil
  end

  def self.print_laugh_and_author
    Laugh.includes(:author).each do |laugh|
        # by using .includes, this will launch a second query to pre-fetch all 
        # the associated data
       p "#{laugh.body} by #{laugh.author.username}"
       # now when we call laugh.author, we will not need to launch another query
    end
    nil
  end
end
