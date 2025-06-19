# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.find_or_create_by!(name: "John Doe", email: "john@example.com", age: 30) do |user|
  user.name = "John Doe"
  user.email = "john@example.com"
  user.age = 30
end

10.times do
    User.find_or_create_by!(name: Faker::Name.name, email: Faker::Internet.email, age: Faker::Number.between(from: 18, to: 65)) do |user|
        user.name = Faker::Name.name
        user.email = Faker::Internet.email
        user.age = Faker::Number.between(from: 18, to: 65)
    end
end
