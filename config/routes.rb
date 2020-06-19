Rails.application.routes.draw do
  get '/index', to: 'posts#index'
  root 'static_pages#home'

  
  get '/', to: 'static_pages#home'
  get '/about', to: 'static_pages#about'
end
