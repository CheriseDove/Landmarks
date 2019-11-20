Rails.application.routes.draw do
  get 'attractions/index'
  root to: 'attractions#index', as: 'attractions'
  resources :landmarks
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
