# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require 'open-uri'
require 'json'
url = "https://tmdb.lewagon.com/movie/top_rated"
json_file = URI.open(url).read
data = JSON.parse(json_file)
data["results"].each do |movie|
  entry = Movie.create(
    title: movie["title"],
    overview: movie["overview"],
    poster_url: "https://image.tmdb.org/t/p/w500#{movie["poster_path"]}",
    backdrop_url: "https://image.tmdb.org/t/p/original#{movie["backdrop_path"]}",
    rating: movie["vote_average"]
  )
end

10.times do
  list = List.new(
    name: Faker::Games::DnD.monster,
  )
  if list.save
    rand(5).times do
      movie = Movie.order("RANDOM()").limit(1)[0]
      bookmark = Bookmark.new(
        comment: Faker::GreekPhilosophers.quote,
        movie_id: movie.id,
        list_id: list.id
      )
      bookmark.save
    end
  end
end
p "Seeding done !"






# movie_title = "The wandering #{Faker::Games::DnD.klass}, #{Faker::Games::DnD.title_name} VS the fearless #{Faker::Games::DnD.monster}"
#   movie = Movie.create(
#     title: movie_title,
#     overview: Faker::GreekPhilosophers.quote,
#     poster_url: ,
#     rating: rand(4.0..10.0).round(1)
#   )
