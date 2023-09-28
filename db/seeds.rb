# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
#user1 = User.create(email: "bala@gmail.com", password: "bala86..")
#user2 = User.create(email: "bala86@gmail.com", password: "bala86..")

#movie1 = Movie.create(name: "Star Wars", release_date: '1978-07-01')
#movie2 = Movie.create(name: "Lord of the Rings", release_date: '2002-03-15')

#Review.create(user: user1, movie: movie1, comment: "Great Movie", rating: 5)
#Review.create(user: user2, movie: movie1, comment: "Not bad", rating: 3)
#Review.create(user: user1, movie: movie2, comment: "Good fantasy story", rating: 4)

# Find the last four movies created
#movies_to_delete = Movie.order(created_at: :desc).limit(4)

# Delete the selected movies
#movies_to_delete.destroy_all

# Create an array of real movie titles and release dates
movie_data = [
  { name: "The Shawshank Redemption", release_date: "1994/10/14" },
  { name: "The Godfather", release_date: "1972/03/24" },
  { name: "The Dark Knight", release_date: "2008/07/24" },
  { name: "Pulp Fiction", release_date: "1994/10/21" },
  { name: "Schindler's List", release_date: "1993/02/11" },
  { name: "The Lord of the Rings: The Return of the King", release_date: "2003/12/17" },
  { name: "Forrest Gump", release_date: "1994/10/07" },
  { name: "Inception", release_date: "2010/07/16" },
  { name: "The Matrix", release_date: "1999/03/30" },
  { name: "The Silence of the Lambs", release_date: "1991/01/26" },
  { name: "Gladiator", release_date: "2000/05/05" },
  { name: "The Godfather: Part II", release_date: "1974/12/20" },
  { name: "The Lord of the Rings: The Fellowship of the Ring", release_date: "2001/12/19" },
  { name: "The Empire Strikes Back", release_date: "1980/06/20" },
  { name: "Saving Private Ryan", release_date: "1998/07/24" },
  { name: "Jurassic Park", release_date: "1993/07/16" },
  { name: "The Avengers", release_date: "2012/04/26" },
  { name: "Titanic", release_date: "1997/01/08" },
  { name: "Avatar", release_date: "2009/12/18" },
  { name: "The Lion King", release_date: "1994/06/24" }
]

# Create movie records with the provided data
movie_data.each do |data|
  Movie.create(data)
end