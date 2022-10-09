Rails.application.routes.draw do
  root 'processors#index'

  resources :processors
  resources :motherboards
  resources :graphics_cards
  resources :power_supplies
  resources :rams
end
