# https://github.com/stympy/faker

####### SETTINGS #######
n_users = 10
n_anuncis_per_user = 5
n_shops = 5
n_coupons_per_shop = 1
n_bids_per_user= 4
#num_anun = 0
#num_users= 0


################################################################################
def randLatitude
  Random.new.rand(41.3..41.4)
end

def randLongitude
  Random.new.rand(2.0..2.2)
end
################################################################################


# Create users
n_users.times do
  User.create name: Faker::Name.name, email: Faker::Internet.safe_email, platform_name: ["Facebook", "Google", "Twitter"].sample
end

# Create anuncis per user
User.all.each do |user|
  #num_users += 1
  #p("user #" +num_users.to_s+ " of "+User.all.count.to_s)
  #num_anun = 0
  n_anuncis_per_user.times do
    #num_anun += 1 
    #p("anunci #"+num_anun.to_s+" of user #"+num_users.to_s)
    anunci = user.anuncis.create( title: Faker::Job.title, 
                          description: Faker::HarryPotter.quote, 
                          latitude: randLatitude, 
                          longitude: randLongitude, 
                          reward: Faker::Number.number(1) )
    anunci.comentaris.create text: Faker::FamilyGuy.quote, user_id: [user.id - 1, 1].max  
  end   
end

User.all.each do |user|
  other_anuncis = Anunci.where("user_id != ?",user.id)
  i_bid = 0
  until user.bids.count == n_bids_per_user do
    #p("insert new bid")
    anunci = other_anuncis.sample
    #p("Anunci.id = "+anunci.id.to_s)
    if !anunci.bids.exists?(:user_id=>user.id)
      user.bids.create(amount: Faker::Number.number(1),anunci_id: anunci.id)     
    end
  end
end


# Create shops
n_shops.times do
  Shop.create(  name: Faker::SiliconValley.company, 
                description: Faker::SiliconValley.motto, 
                latitude: randLatitude, 
                longitude: randLongitude, 
                user_id: User.first.id)
end

# Add coupons to shops
Shop.all.each do |shop|
  n_coupons_per_shop.times do
    shop.coupons.create(
      title: Faker::Commerce.promotion_code,
      description: Faker::HowIMetYourMother.quote,
      price: Faker::Number.between(1, 10),
      discount: Faker::Number.decimal(2)
    )
  end
end
