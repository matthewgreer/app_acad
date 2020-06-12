# == Schema Information
#
# Table name: responses
#
#  id               :bigint           not null, primary key
#  question_id      :integer          not null
#  answer_choice_id :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Response < ApplicationRecord


end
