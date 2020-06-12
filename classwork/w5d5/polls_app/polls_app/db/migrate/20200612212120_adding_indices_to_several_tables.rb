class AddingIndicesToSeveralTables < ActiveRecord::Migration[5.2]
  def change
    add_index(:questions, :response_id, {unique: true})
    add_index(:answer_choices, :response_id, {unique: true})
    add_index(:responses, :question_id, {unique: true})
    add_index(:responses, :answer_choice_id, {unique: true})
  end
end
