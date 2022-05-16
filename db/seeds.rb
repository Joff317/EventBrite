# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

10.times do 
   User.create(
     first_name: Faker::Name.first_name,
     last_name: Faker::Name.last_name,
     description: Faker::Lorem.sentence(word_count: 10),
     email: Faker::Internet.email
     )
end

t1 = Time.parse("2022-01-23 13:30:33")
t2 = Time.parse("2025-01-23 13:30:33")

5.times do 
   Event.create(
    start_date: rand(t1..t2),
    duration: rand(5..100)*5,
    description: Faker::Lorem.sentence(word_count: 150),
    location: Faker::Address.city,
    price: rand(1..1000),
    title: Faker::Book.title,
    admin_id: User.all.sample.id)
end 

20.times do 
   Attendance.create(
      user_id: User.all.sample.id, 
      event_id: Event.all.sample.id 
   )
end