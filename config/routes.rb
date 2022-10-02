Rails.application.routes.draw do
  root 'processors#index'

  resources :processors
end
