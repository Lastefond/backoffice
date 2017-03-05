Rails.application.routes.draw do
  require 'sidekiq/web'

  mount Sidekiq::Web => '/sidekiq'
  
  root 'boxes#index'
  resources :donations
  resources :donators
  resources :donator
  resources :boxes do
  	#member do
  	#  patch :update_last_online
  	#end
  	put '/', action: :update, on: :member
  	patch '/', action: :update_last_online, on: :member
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
