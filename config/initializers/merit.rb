# Use this hook to configure merit parameters
Merit.setup do |config|
  # Check rules on each request or in background
  # config.checks_on_each_request = true

  # Add application observers to get notifications when reputation changes.
  # config.add_observer 'MyObserverClassName'

  # Define :user_model_name. This model will be used to grand badge if no
  # `:to` option is given. Default is 'User'.
  # config.user_model_name = 'User'

  # Define :current_user_method. Similar to previous option. It will be used
  # to retrieve :user_model_name object if no `:to` option is given. Default
  # is "current_#{user_model_name.downcase}".
  # config.current_user_method = 'current_user'
end

Merit::Badge.create!(
  id: 1,
  name: "test",
  description: "This is a test badge"
)

Merit::Badge.create!(
  id: 2,
  name: "welcome",
  description: "Welcome to AgorApp!"
)

Merit::Badge.create!(
  id: 3,
  name: "first-anunci",
  description: "El teu primer anunci, felicitats!"
)

Merit::Badge.create!(
  id: 4,
  name: "first-job",
  description: "La teva primera feina, felicitats!"
)

Merit::Badge.create!(
  id: 5,
  name: "first-bid",
  description: "La teva primera licitació, felicitats!"
)

Merit::Badge.create!(
  id: 6,
  name: "first-coupon",
  description: "La teva primera compra, felicitats!"
)

Merit::Badge.create!(
  id: 7,
  name: "first-feedback",
  description: "La teva primera valoració, felicitats!"
)