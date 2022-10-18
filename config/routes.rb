Rails.application.routes.draw do
  get "/find_processors" => "pages#processors"
  get "/:processor/find_motherboards" => "pages#motherboards"
  get "/:motherboard/find_rams" => "pages#rams"
  get "/:ram/find_graphics_cards" => "pages#graphics_cards"
  get "/:graphics_card/find_psus" => "pages#psus"
  post "/create_setup" => "pages#create"
  root 'pages#index'

  resources :processors
  resources :motherboards
  resources :graphics_cards
  resources :power_supplies
  resources :rams
  resources :setups
end
