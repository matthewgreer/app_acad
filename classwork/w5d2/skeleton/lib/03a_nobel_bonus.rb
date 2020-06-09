# == Schema Information
#
# Table name: nobels
#
#  yr          :integer
#  subject     :string
#  winner      :string

require_relative './sqlzoo.rb'

def physics_no_chemistry
  # In which years was the Physics prize awarded, but no Chemistry prize?
  execute(<<-SQL)
    SELECT
      nobels.yr
    FROM
      nobels
    WHERE
      nobels.subject = 'Physics' EXCEPT (
        SELECT
          nobels.yr
        FROM
          nobels
        WHERE
          nobels.subject = 'Chemistry' 
      ) 
  SQL
end
