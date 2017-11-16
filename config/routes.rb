Rails.application.routes.draw do

 resources :users
 resources :anuncis
 resources :comentaris
 
 post '/users/login/', to: 'users#login'
 post '/users/logout/', to: 'users#logout'
 
 # en comptes de resources :comentaris, seria millor:
 #resources :anuncis do
  #resources :comentaris, only[:index,:create,:update,:destroy]
 #end
 # aixo crearia al rails routes:
 # anunci_comentaris POST   /anuncis/:anunci_id/comentaris(.:format)    comentaris#create
 #                   GET    /anuncis/:anunci_id/comentaris(.:format)    comentaris#index
 # anunci_comentari  PUT    /anuncis/:anunci_id/comentaris/:id(.format) comentaris#update
 #                   DELETE /anuncis/:anunci_id/comentaris/:id(.format) comentaris#destroy
 # al test seria :
 # anunci_comentaris_path(id_anunci)
 # anunci_comentari_path(anunci_id,comentari_id)
end