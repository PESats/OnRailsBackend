Rails.application.routes.draw do

 resources :users do
    resources :bids, only: [:index,:create,:update,:destroy]
    resources :bought_coupons, only: [:index,:show,:create,:destroy]
 end
 resources :anuncis do
  resources :comentaris, only: [:index,:create,:update,:destroy]
  resources :bids, only: [:index]    
 end
 resources :comentaris
 resources :shops
 
 #TODO ruta per BIDS: user/id/bids, anunci/id/bids
 #resources :bids
 resources :coupons


 post '/users/login/', to: 'users#login'
 post '/users/logout/', to: 'users#logout'
 get  '/users/contacts', to: 'users#contacts'
 #get  '/anuncis/:/bids', to: 'bids#index', as: 'anunci_bids_index'
 #get  '/users/:id/bids', to: 'bids#index', as: 'user_bids_index'

 
 #get  'users/:id/acceptedBids', to: 'bids#userAcceptedBidsIndex'
 #get  'users/:id/selectedBids', to: 'bids#userAnuncisAcceptedBidsIndex'
 #get  'anuncis/:id/bids'
 #TODO corregir les rutes per acceptar/completar els anuncis
 put  '/users/:user_id/anuncis/:id/select', to: 'anuncis#selectBid',as: 'user_anunci_select'
 put  '/users/:user_id/anuncis/:id/cancel', to: 'anuncis#cancelBidSelection', as: 'user_anunci_cancel'
 put  '/users/:user_id/anuncis/:id/complete', to: 'anuncis#confirmCompletion', as: 'user_anunci_complete'

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
