# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy_all 
Event.destroy_all 
Attendance.destroy_all 

2.times do |x|
   User.create!(
     email: "user#{x}@yopmail.com",
     first_name: Faker::Name.first_name,
     last_name: Faker::Name.last_name,
     description: Faker::Lorem.sentence(word_count: 10),
     password: "azerty"
     )
end

t1 = Time.parse("2022-12-23 13:30:33")
t2 = Time.parse("2025-01-23 13:30:33")

5.times do 
   Event.create!(
    start_date: rand(t1..t2),
    duration: rand(5..100)*5,
    description: Faker::Lorem.sentence(word_count: 150),
    location: Faker::Address.city,
    price: rand(1..1000),
    title: Faker::Book.title,
    admin: User.all.sample)
end 

Event.all.each do |event|
   n = rand(1..3)
   n.times do 
      Attendance.create!(
         event: event,
         attendant: User.all.sample
      )
   end
end