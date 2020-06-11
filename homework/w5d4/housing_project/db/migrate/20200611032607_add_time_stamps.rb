class AddTimeStamps < ActiveRecord::Migration[5.2]
  def change
    add_timestamps :people

    create_table :houses do |t|
      t.string :address, null: false
      t.timestamps
    end

  end
end
