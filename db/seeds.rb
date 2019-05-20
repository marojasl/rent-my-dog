# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



photo1 = "https://images.unsplash.com/photo-1517423440428-a5a00ad493e8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
photo2 = "https://images.unsplash.com/photo-1518717758536-85ae29035b6d?ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80"
photo3 = "https://images.unsplash.com/photo-1530281700549-e82e7bf110d6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80"
photo4 = "https://images.unsplash.com/photo-1529429617124-95b109e86bb8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
photo5 = "https://images.unsplash.com/photo-1504826260979-242151ee45b7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
photo6 = "https://images.unsplash.com/photo-1505628346881-b72b27e84530?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"
photo7 = "https://images.unsplash.com/photo-1544568104-5b7eb8189dd4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
photo8 = "https://images.unsplash.com/photo-1518378188025-22bd89516ee2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
photo9 = "https://images.unsplash.com/photo-1491604612772-6853927639ef?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
photo10 = "https://images.unsplash.com/photo-1546460573-e6c02e39568a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
photos = [photo1, photo2, photo3, photo4, photo5, photo6, photo7, photo8, photo9, photo10 ]

require 'faker'

Dog.destroy_all

10.times do
  dog = Dog.new(
    name: Faker::Creature::Dog.name,
    address: Faker::Address.full_address,
    breed: Faker::Creature::Dog.breed,
    description: " #{Faker::Creature::Dog.size} - #{Faker::Creature::Dog.coat_length}",
    age: Faker::Creature::Dog.age,
    user: User.first,
    rate: Faker::Number.number(3),
    longitude: Faker::Address.longitude,
    latitude: Faker::Address.latitude
  )
  dog.remote_photo_url = "#{photos.sample}"
  dog.save!
end
