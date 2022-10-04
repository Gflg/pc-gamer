Rails.application.routes.draw do
  root 'processors#index'

  resources :processors
  resources :motherboards
  resources :graphics_cards
end
