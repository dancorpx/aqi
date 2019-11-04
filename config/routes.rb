Rails.application.routes.draw do
  resources :cities
  #  get 'home/zipcode'
  root 'home#index'
  get 'zipcode' => 'home#index'
  post "zipcode" => 'home#zipcode'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
