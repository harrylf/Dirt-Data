Rails.application.routes.draw do
  resources :water_readings
  resources :gardens
  get 'gardens/register/:id' => 'gardens#register', :as => :register_garden
  devise_for :users
  resources :readings
  root 'gardens#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
