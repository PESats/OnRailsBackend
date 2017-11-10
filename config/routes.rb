Rails.application.routes.draw do

 resources :users
 resources :anuncis
 resources :comentaris
 
 post '/users/login/', to: 'users#login'
 post '/users/logout/', to: 'users#logout'
 
end