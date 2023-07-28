require 'faker'
# This is where you can create initial data for your app.
1000.times do |i|
  Restaurant.create(
    name: Faker::Name.name,
    address: Faker::Address.full_address,
    ratings: rand(0..5)
  )
end

