class CreateResponse < ActiveRecord::Migration[5.2]
  def change
    
    change_table :questions do |t|
      t.integer :response_id
    end
    
    change_table :answer_choices do |t|
      t.integer :response_id
    end   
    
    create_table :responses do |t|
      t.integer :question_id, null: false
      t.integer :answer_choice_id, null: false
  
      t.timestamps
    end

  end

end
