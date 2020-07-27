class AddIndexAndConstraints < ActiveRecord::Migration[5.2]
  def change
    add_index :laughs, :author_id
    # add_index :table_name, :column_name
    add_index :users, :location_id
    change_column :locations, :name, :string, null: false
    # change_column :table_name, :column_name, :col_type, constraint(optional)
    add_index :users, :username, unique: true
    # we need to add an index to :username in order to add the unique constraint

    # add_index allows for very fast look up, we will usually add an index to foreign keys or any columns we will use to search the db with
    # don't edit or delete a migration that has been run
  end
end
