# == Schema Information
#
# Table name: cats
#
#  id         :bigint           not null, primary key
#  name       :string
#  age        :integer
#  sex        :string
#  biography  :text
#  coat_color :string
#  birth_date :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Cat < ApplicationRecord
end
