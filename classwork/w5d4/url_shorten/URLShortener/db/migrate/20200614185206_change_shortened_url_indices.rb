class ChangeShortenedUrlIndices < ActiveRecord::Migration[5.2]
  def change
    change_table :shortened_urls do |t|
      t.remove_index :user_id
      t.index :user_id
    end
  end
end
