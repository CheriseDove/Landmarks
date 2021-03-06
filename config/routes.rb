Rails.application.routes.draw do
  resources :users
  resources :book_nows
  resources :line_landmarks
  resources :lists
  root to: 'attractions#index', as: 'attractions'

  resources :landmarks do
  get :who_bought, on: :member
end

get 'admin' => 'admin#index'

controller :sessions do
  get 'login' => :new
  post 'login' => :create
  delete 'logout' => :destroy
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
