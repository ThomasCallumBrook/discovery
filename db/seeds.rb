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
  {bounds: 'test1', name: 'Afghanistan', user:us[0]},
  {bounds: 'test2', name: 'Angola', user:us[0]},
  {bounds: 'test3', name: 'GERMANYTEST', user:us[0]},
  {bounds: 'test4', name: 'BELGIUMTEST', user:us[0]},
  {bounds: 'test5', name: 'SPAINTEST', user:us[0]},
  {bounds: 'test6', name: 'PORTUGALEST', user:us[0]},
  {bounds: 'test7', name: 'POLANDTEST', user:us[0]},
  {bounds: 'test8', name: 'AZERBAIJANTEST', user:us[0]},
  {bounds: 'test9', name: 'IRAQTEST', user:us[0]},
  {bounds: 'test10', name: 'IRANTEST', user:us[0]},
  {bounds: 'test11', name: 'IRELANDTEST', user:us[0]},
  {bounds: 'test12', name: 'CANADATEST', user:us[0]},
  {bounds: 'test13', name: 'USATEST', user:us[0]},
  {bounds: 'test14', name: 'BRAZILTEST', user:us[0]},
  {bounds: 'test15', name: 'CHILETEST', user:us[0]},
  {bounds: 'test16', name: 'BOLIVATEST', user:us[0]},
  {bounds: 'test17', name: 'ARGENTINATEST', user:us[0]},
  {bounds: 'test18', name: 'PORTORICOTEST', user:us[0]},
  {bounds: 'test19', name: 'AUSTRALIA', user:us[0]},
  {bounds: 'test20', name: 'AUSTRIA', user:us[0]},
  {bounds: 'test21', name: 'UKRAINETEST', user:us[0]},
  {bounds: 'test22', name: 'MARSHALLISLANDSTEST', user:us[0]},
  {bounds: 'test23', name: 'EYGYPTTEST', user:us[0]},
  {bounds: 'test24', name: 'SOMALIATEST', user:us[0]},
  {bounds: 'test25', name: 'NIGERTEST', user:us[0]},

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
