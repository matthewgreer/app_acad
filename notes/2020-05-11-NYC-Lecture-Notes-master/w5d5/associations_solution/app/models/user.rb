# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ApplicationRecord
  # Remember, has_many is just a method where the first argument is
  # the name of the association, and the second argument is an options
  # hash.
  has_many :enrollments, # creates a User#enrollments method
    class_name: 'Enrollment',
    foreign_key: :student_id,
    primary_key: :id

  has_many :enrolled_courses,
    through: :enrollments,
    source: :course

  has_many :taught_courses,
    class_name: :Course,
    primary_key: :id,
    foreign_key: :instructor_id
  
  has_many :taught_students,
    through: :taught_courses,
    source: :enrolled_students
end
