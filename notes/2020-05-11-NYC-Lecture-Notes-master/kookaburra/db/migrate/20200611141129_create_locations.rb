class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :name, null: :false # false should not be a symbol - typo!, so we didn't actually add this constraint
                                   # we cannot fix it here, since this has already been migrated
      t.timestamps # creates updated_at and created_at columns
    end
  end
end
