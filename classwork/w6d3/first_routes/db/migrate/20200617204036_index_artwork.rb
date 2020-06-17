class IndexArtwork < ActiveRecord::Migration[5.2]
  def change
    change_table :artworks do |t|
      t.timestamps
    end

    add_index :artworks, [:artist_id, :title], :unique => true  
  end
end
