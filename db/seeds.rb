# https://github.com/stympy/faker

# Create 10 random users
10.times do
  User.create name: Faker::Name.name, email: Faker::Internet.safe_email, platform_name: ["Facebook", "Google", "Twitter"].sample
end

r = Random.new

# Create 10 random anuncis per user
User.all.each do |user|
  10.times do
    anunci = user.anuncis.create( title: Faker::Lorem.sentence, 
                          description: Faker::Lorem.paragraph, 
                          latitude: r.rand(41.3..41.4), 
                          longitude: r.rand(2.0..2.2), 
                          reward: Faker::Number.number(1) )
    anunci.comentaris.create text: Faker::FamilyGuy.quote, user_id: [user.id - 1, 1].max
  end
end

# Create two shops
Shop.create(  name: Faker::SiliconValley.company, 
              description: Faker::SiliconValley.motto, 
              latitude: r.rand(41.3..41.4), 
              longitude: r.rand(2.0..2.2), 
              user_id: User.first.id)
Shop.create(  name: Faker::SiliconValley.company, 
              description: Faker::SiliconValley.motto, 
              latitude: r.rand(41.3..41.4), 
              longitude: r.rand(2.0..2.2), 
              user_id: User.last.id)
