require 'open-uri'

Bookmark.destroy_all
Movie.destroy_all
List.destroy_all

url = 'http://tmdb.lewagon.com/movie/top_rated'

response = URI.open(url)
json = JSON.parse(response.read)

movies = json['results']

movies.each do |movie|
  title = movie['title']
  overview = movie['overview']
  poster_url = 'https://image.tmdb.org/t/p/original' + movie['poster_path']
  rating = movie['vote_average']
  new_movie = Movie.create(title: title, overview: overview, poster_url: poster_url, rating: rating)
  puts new_movie.poster_url
end

List.create(name: 'Drama')
List.create(name: 'Thriller')
List.create(name: 'Action')
