Rails.application.routes.draw do
  root 'boxes#index'
  resources :donations
  resources :donators
  resources :donator
  resources :boxes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
