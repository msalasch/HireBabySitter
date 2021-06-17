Rails.application.routes.draw do

resources :users

#post 'auth_user' => 'authentication#authenticate_user'
post 'auth_user' => 'users#authenticate_user'
get 'searchByName/:name' => 'users#searchByName'
get 'searchByLocation/:location' => 'users#searchByLocation'
get 'searchByHour/:hour' => 'users#searchByHour'
get 'home' => 'home#index'
post 'home' => 'home#index'
get 'home' => 'home#showEmployees'
post 'confirm' => 'users#confirm'
end
