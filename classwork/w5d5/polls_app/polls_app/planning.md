PollsApp

User class (Model)
username - string, unique, not null

has_many :authored_polls

has_many :responses

#not_duplicate_response





Poll class (Model)
title - string, unique?, not null
author_id - not null

has_many :questions

belongs_to :author  *auto-validates






Questions class (Model)
text - text, not null
poll_id - not null

has_many :answer_choices

belongs_to :poll  *auto-validates






AnswerChoice class (Model)
text - text, not null
question_id - not null

belongs_to :question  *auto-validates

has_many: :responses through




Response class (Model)
question_id - not null
answer_id

belongs_to :user (respondent)  *auto-validates

belongs_to :answer_choice  *auto-validates

has_one :question through

#sibling_responses






