# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Movie.create!(
  title: "Inception",
  overview: "A thief enters people's dreams to steal secrets.",
  poster_url: "https://example.com/inception.jpg",
  rating: 8.8
)

Movie.destroy_all
List.destroy_all
Bookmark.destroy_all

movies = [
  { title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s.", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9 },
  { title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison.", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7 },
  { title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9 },
  { title: "The Green Mile", overview: "A supernatural tale set on death row in a Southern prison.", poster_url: "https://image.tmdb.org/t/p/original/velWPhVMQeQKcxggNEU8Vyh0b52R.jpg", rating: 8.5 },
  { title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0 }
]

lists = [
  { name: "Drama" },
  { name: "All time favourites" },
  { name: "Girl Power" }
]

movies.each { |movie| Movie.create!(movie) }
lists.each { |list| List.create!(list) }

Bookmark.create!(comment: "Recommended by John", movie: Movie.find_by(title: "Titanic"), list: List.find_by(name: "All time favourites"))
Bookmark.create!(comment: "Superhero movie revisited in 2020", movie: Movie.find_by(title: "Wonder Woman 1984"), list: List.find_by(name: "Girl Power"))
Bookmark.create!(comment: "Spielberg's masterly Oscar-winning drama", movie: Movie.find_by(title: "The Shawshank Redemption"), list: List.find_by(name: "All time favourites"))
Bookmark.create!(comment: "2020 release", movie: Movie.find_by(title: "Ocean's Eight"), list: List.find_by(name: "Drama"))
Bookmark.create!(comment: "Based on Stephen King's 1996 novel", movie: Movie.find_by(title: "The Green Mile"), list: List.find_by(name: "Drama"))
