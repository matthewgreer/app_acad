# == Schema Information
#
# Table name: questions
#
#  id          :bigint           not null, primary key
#  text        :text             not null
#  poll_id     :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  response_id :integer
#
class Question < ApplicationRecord

end
