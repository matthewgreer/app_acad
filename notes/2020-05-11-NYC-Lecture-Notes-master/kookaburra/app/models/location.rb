# == Schema Information
#
# Table name: locations
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Location < ApplicationRecord
  validates :name, presence: true

  has_many :users,
    primary_key: :id, 
    foreign_key: :location_id,
    class_name: :User 

  has_many :laughs,
    through: :users, # :users is our own :users association defined above
    source: :laughs # :laughs is an association from the User model (note: this happens to be the same name as what we named our current has_many association but it NOT THE SAME THING)


  def self.location_with_no_laughs
    Location.left_outer_joins(:laughs).where( laughs: { body: nil } ).distinct
    # Location.left_outer_joins(:laughs).where("body IS NULL")
    # Location.left_outer_joins(:laughs).where("laughs.body IS NULL")
  end
end
