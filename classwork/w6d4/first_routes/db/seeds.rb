# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ActiveRecord::Base.transaction do

  User.delete_all
  Artwork.delete_all
  ArtworkShare.delete_all
  Comment.delete_all


  u1 = User.create!(username: 'Paul')
  u2 = User.create!(username: 'Matthew')
  u3 = User.create!(username: 'Alvin')
  u4 = User.create!(username: 'Kafele')
  u5 = User.create!(username: 'Andy')

  a1 = Artwork.create!(
    title: 'Ruby Painting',
    image_url: 'google.com/ruby_painting.jpg',
    artist_id: u1.id)
  a2 = Artwork.create!(
    title: 'Rails Sculpture', 
    image_url: 'google.com/rails_sculpture.jpg', 
    artist_id: u2.id)
  a3 = Artwork.create!(
    title: 'JavaScript Mural', 
    image_url: 'google.com/javascript_mural.jpg', 
    artist_id: u3.id)
  a4 = Artwork.create!(
    title: 'Perl Necklace',  
    image_url: 'google.com/perl_necklace.jpg',
    artist_id: u4.id)
  a5 = Artwork.create!(
    title: 'Basic Black Painting',
    image_url: 'google.com/basic_black_painting.jpg',
    artist_id: u5.id)

  as1 = ArtworkShare.create!(
    artwork_id: a1.id,
    viewer_id: u2.id)
  as2 = ArtworkShare.create!(
    artwork_id: a2.id,
    viewer_id: u4.id)
  as3 = ArtworkShare.create!(
    artwork_id: a3.id,
    viewer_id: u5.id)
  as4 = ArtworkShare.create!(
    artwork_id: a4.id,
    viewer_id: u3.id)
  as5 = ArtworkShare.create!(
    artwork_id: a5.id,
    viewer_id: u1.id)

  c1 = Comment.create!(
    artwork_id: a3.id,
    user_id: u2.id,
    body: "This is AMAZING!")

  c2 = Comment.create!(
    artwork_id: a1.id,
    user_id: u2.id,
    body: "This is WONDERFUL!")

  c3 = Comment.create!(
    artwork_id: a4.id,
    user_id: u2.id,
    body: "This is COOL!")

  c4 = Comment.create!(
    artwork_id: a5.id,
    user_id: u2.id,
    body: "This is CRAZY!")

end