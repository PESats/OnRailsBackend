# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Per a quan implementem el sistema d'admin
#admin = User.create name: 'Admin', email: 'admin@example.com', platform_name: 'Google'

# Create 10 random users
10.times do
  User.create name: Faker::Name.name, email: Faker::Internet.safe_email, platform_name: ["Facebook", "Google", "Twitter"].sample
end

# Create 10 random anuncis per user
User.all.each do |user|
  10.times do
    user.anuncis.create(  title: Faker::Lorem.sentence, 
                          description: Faker::Lorem.paragraph, 
                          latitude: Faker::Number.decimal(1, 3), 
                          longitude: Faker::Number.decimal(1, 3), 
                          reward: Faker::Number.number(1) )
  end
end
