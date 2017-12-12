# https://github.com/stympy/faker

####### SETTINGS #######
n_users = 10
n_anuncis_per_user = 2
n_shops = 5
n_coupons_per_shop = 1
n_bids_per_user = 1

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
  n_anuncis_per_user.times do
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
#fer que tots els anuncis tinguin un bid seleccionat
# Anunci.all.each do |anun|
#   bid_id = anun.bids.select("id").sample
#   anun.selectBid(bid_id.to_i)
#   anun.save
# end


# Create shops
n_shops.times do
  Shop.create(  name: Faker::SiliconValley.company,
                description: Faker::SiliconValley.motto,
                latitude: randLatitude,
                longitude: randLongitude,
                user_id: User.first.id
  )
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
