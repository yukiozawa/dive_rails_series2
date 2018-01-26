# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

100.times do |n|
  email = Faker::Internet.email
  user_name = Faker::Name.unique.name
  password = "password"
  User.create!(email: email,
              name: user_name,
               password: password,
               password_confirmation: password,
               )
end
