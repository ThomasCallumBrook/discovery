# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = [
  {email: 'a@a.com', name: 'Tom', password:'testing'},
  {email: 'e@a.com', name: 'Dave', password:'testing'},
  {email: 'b@a.com', name: 'Bill', password:'testing'},
  {email: 'c@a.com', name: 'Sarah', password:'testing'},
  {email: 'd@a.com', name: 'Jenny', password:'testing'}
]

us = users.map do |user|
    User.create!(user)
end

countries = [
  {bounds: '33.902427,67.84322900000001', name: 'Afghanistan', user:us[0]},
  {bounds: '-11.1843295,17.860000499999998', name: 'Angola', user:us[0]}
]

co = countries.map do |country|
  Country.create!(country)
end
blogs = [
  {title: 'Hello London', post: 'I went to London, it was the tits', country:co[0]},
  {title: 'Aberdeen!', post: 'The visit to Aberdeenshire, was enjoyable. The city was impressive', country:co[0]},
]

bl = blogs.map do |blog|
  Blog.create!(blog)
end
