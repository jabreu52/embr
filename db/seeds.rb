# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "CREATE GROUPS"
20.times do
  Group.create(
    name: Faker::Company.name
  )
end

puts "CREATE USERS"
20.times do
  User.create(
    email: Faker::Internet.email,
    password: "password",
    name: "#{Faker::Name.first_name} #{Faker::Name.last_name}",
    image: "http://graph.facebook.com/#{rand(300000..302715)}/picture?type=normal",
    groups: Group.all.sample(2)
  )
end