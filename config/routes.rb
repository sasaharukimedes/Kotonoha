Rails.application.routes.draw do
  
  devise_for :users
  root 'static_pages#home'
  resources :posts do
    resources :replies
  end
  
  resources :users
  
  get '/', to: 'static_pages#home'
  get 'about', to: 'static_pages#about'

  

end
