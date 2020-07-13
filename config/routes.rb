Rails.application.routes.draw do
  
  devise_for :users
  root 'static_pages#home'
  resources :posts
  resources :users
  
  get '/', to: 'static_pages#home'
  get 'about', to: 'static_pages#about'

end
