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

#Merit::Badge.create!(
#  id: 1,
#  name: "test",
#  description: "This is a test badge, no user should have or see it."
#)

Merit::Badge.create!(
  id: 2,
  name: "Benvingut!",
  description: "Has iniciat sessió per primer cop a AgorApp."
)

Merit::Badge.create!(
  id: 3,
  name: "Anunciant Novell",
  description: "Has publicat el teu primer anunci. Felicitats!"
)

#Merit::Badge.create!(
#  id: 4,
#  name: "first-job",
#  description: "La teva primera feina, felicitats!"
#)

Merit::Badge.create!(
  id: 5,
  name: "Ganes de Treballar",
  description: "T'has ofert per primer cop per a realitzar una feina. Felicitats!"
)

Merit::Badge.create!(
  id: 6,
  name: "Comprador Novell",
  description: "Has comprat el teu primer cupó. Felicitats!"
)

#Merit::Badge.create!(
#  id: 7,
#  name: "first-feedback",
#  description: "La teva primera valoració, felicitats!"
#)

#Merit::Badge.create!(
#  id: 8,
#  name: "first-comment",
#  description: "El teu primer comentari, felicitats!"
#)

Merit::Badge.create!(
  id: 9,
  name: "Comprador Compulsiu",
  description: "Has comprat 5 cupons. Felicitats!"
)

Merit::Badge.create!(
  id: 10,
  name: "Treballador Compulsiu",
  description: "Has realitzat 5 feines. Felicitats!"
)

Merit::Badge.create!(
  id: 11,
  name: "Anunciant Expert",
  description: "Has publicat 5 anuncis. Felicitats!"
)
