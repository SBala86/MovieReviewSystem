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
movies_to_delete = Movie.order(created_at: :desc).limit(4)

# Delete the selected movies
movies_to_delete.destroy_all