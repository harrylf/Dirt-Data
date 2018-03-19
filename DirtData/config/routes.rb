Rails.application.routes.draw do
  resources :gardens
  devise_for :users
  resources :readings
  root 'gardens#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
