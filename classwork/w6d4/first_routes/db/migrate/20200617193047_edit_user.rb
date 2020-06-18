class EditUser < ActiveRecord::Migration[5.2]
  def change
    # change_table :users do |t|
    #   t.remove :name
    #   t.remove :email
        

    #   t.timestamps
    # end

    remove_column :users, :name  
    remove_column :users, :email
    add_column :users, :username, :string, null: false
    add_index :users, :username, unique: true


  end
end
