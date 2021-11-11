# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

Movie.destroy_all
List.destroy_all
Bookmark.destroy_all

url = 'https://tmdb.lewagon.com/movie/top_rated'

buffer = URI.open(url)
results = JSON.parse(buffer.read)

results = results['results']
# puts results

results.first(20).each do |result|
  Movie.create(
    title: result['original_title'],
    overview: result['overview'],
    poster_url: result['backdrop_path'],
    rating: result['vote_average']
  )
end

5.times do
  List.create(name: 'List')
end

5.times do
  Bookmark.create(comment: 'Great movie!')
end
