Rails.application.routes.draw do
  resources :pago_seguridad_socials
  resources :ahorro_seguridad_socials
  resources :ivas
  resources :capitalizacions
  resources :accions
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "capitalizacions#index"

  namespace :authentication, path: '', as: '' do
    resources :users, only: [:create, :new]
    resources :sessions, only: [:new, :create, :destroy]
  end
end
