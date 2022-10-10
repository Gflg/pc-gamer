Rails.application.routes.draw do
  root 'pages#index'

  resources :processors
  resources :motherboards
  resources :graphics_cards
  resources :power_supplies
  resources :rams
  resources :setups
end
