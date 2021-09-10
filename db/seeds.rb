# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: "mike",
             email: "mike@mike.mike",
             password: "123456",
             password_confirmation: "123456")

99.times do |n|
  name = Faker::Movies::HitchhikersGuideToTheGalaxy.character
  email = "email-#{n+1}@email.email"
  password = "123456"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end

25.times do
  name = Faker::Music::RockBand.name
  description = Faker::Movies::BackToTheFuture.quote
  date = Faker::Date.forward(days: 23)
  time = Faker::Time.forward(days: 5,  period: :evening, format: :long)
  location = Faker::Movies::StarWars.planet
  creator_id = rand(1..100)
  Event.create!(name: name,
                description: description,
                date: date,
                time: time,
                location: location,
                creator_id: creator_id)
end