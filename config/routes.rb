Rails.application.routes.draw do
  resources :restaurants
  resources :restaurant_pizzas
  resources :pizzas
end
