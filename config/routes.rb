Rails.application.routes.draw do

 resources :users 
 resources :anuncis do
  resources :comentaris, only: [:index,:create,:update,:destroy]
  resources :bids, only: [:index]  
 end
 resources :comentaris
 resources :shops
 #TODO ruta per BIDS: user/id/bids, anunci/id/bids
 resources :bids
 resources :coupons


 post '/users/login/', to: 'users#login'
 post '/users/logout/', to: 'users#logout'
 get  '/users/contacts', to: 'users#contacts'
 #TODO corregir les rutes per acceptar/completar els anuncis
 put  '/users/:id/select', to: 'users#selectBid',as: 'user_bid_select'
 put  '/users/:id/cancel', to: 'users#cancelBidSelection', as: 'user_bid_cancel'
 put  '/users/:id/complete', to: 'users#confirmTaskCompletion', as: 'user_anunci_complete'

 #get '/anuncis/:anunci_id/comentaris', to: 'comentaris#index', as: 'anunci_comentaris'

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
