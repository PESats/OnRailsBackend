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
 resources :coupons

 post '/users/:id/evaluations', to: 'evaluations#create', as: 'user_evaluate'
 post '/users/login/', to: 'users#login'
 post '/users/logout/', to: 'users#logout'
 get  '/users/contacts', to: 'users#contacts'
 
 put  '/users/:user_id/anuncis/:id/select', to: 'anuncis#selectBid',as: 'user_anunci_select'
 put  '/users/:user_id/anuncis/:id/cancel', to: 'anuncis#cancelBidSelection', as: 'user_anunci_cancel'
 put  '/users/:user_id/anuncis/:id/complete', to: 'anuncis#confirmCompletion', as: 'user_anunci_complete'
 
 get '/users/:id/badges', to: 'badges#index_user'
 get '/badges', to: 'badges#index'

end
