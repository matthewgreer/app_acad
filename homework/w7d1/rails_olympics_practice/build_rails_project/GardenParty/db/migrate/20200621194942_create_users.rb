class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username, null: false
    end

    add_index :users, :username, unique: true

    create_table :gardens do |t|
      t.string :name, null: false
      t.integer :size, null: false
      t.integer :garden_owner_id
    end 

    add_index :gardens, [:garden_owner_id, :name], unique: true
  
    create_table :flowers do |t|
      t.string :flower_type, null: false
      t.integer :gardener_id
      t.integer :garden_id
    end
  
  end

end
