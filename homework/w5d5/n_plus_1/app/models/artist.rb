class Artist < ApplicationRecord
  has_many :albums,
    class_name: 'Album',
    foreign_key: :artist_id,
    primary_key: :id

  def n_plus_one_tracks
    albums = self.albums
    tracks_count = {}
    albums.each do |album|
      tracks_count[album.title] = album.tracks.length
    end

    tracks_count
  end

  def better_tracks_query
    albums = self.albums
      .select('albums.*, COUNT(*) AS tracks_count')
      .join(:tracks)
      .group('albums_id')

    tracks_tally = {}
    albums.each do |album|
      tracks_tally[album.title] = album.tracks_count
    end

    tracks_tally

  end
end
