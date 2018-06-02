# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create([
  {email: 'a@a.com', name: 'Tom', password:'testing'},
  {email: 'e@a.com', name: 'Dave', password:'testing'},
  {email: 'b@a.com', name: 'Bill', password:'testing'},
  {email: 'c@a.com', name: 'Sarah', password:'testing'},
  {email: 'd@a.com', name: 'Jenny', password:'testing'}
])
