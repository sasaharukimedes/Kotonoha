Rails.application.routes.draw do
  root 'static_pages#home'
  
  get 'posts/index', to: 'posts#index'
  get 'posts/new', to: 'posts#new'
  get 'posts/:id', to: 'posts#show'
  post 'posts/create', to:'posts#create'

  
  get '/', to: 'static_pages#home'
  get 'about', to: 'static_pages#about'
end
