Given the following table write all the `belongs_to` and `has_many` associations
for models based on the below table (`User`, `Game`, and `Score`)

```ruby
# == Schema Information
#
# Table name: user
#
#  id   :integer          not null, primary key
#  name :string           not null


# Table name: score
#
#  id   :integer           not null, primary key
#  number :integer         not null
#  user_id :integer        not null
#  game_id :integer        not null


# Table name: game
#
#  id   :integer           not null, primary key
#  name :string            not null
#  game_maker_id :integer  not null


class User
  has_many :scores,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :Score

    has_many :games_made,
    primary_key: :id,
    foreign_key: :game_maker_id,
    class_name: :Games
end

class Score
  belongs_to :users,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :games,
    primary_key: :id,
    foreign_key: :game_id,
    class_name: :Game
end

class Game
    has_many :scores,
    primary_key: :id,
    foreign_key: :game_id,
    class_name: :Score

    belongs_to :game_maker,
      primary_key: :id,
      foreign_key: :game_maker_id,
      class_name: :User
end