Rails.application.routes.draw do

  devise_for :users, skip: [:sessions]
  as :user do
    get 'signin', to: 'devise/sessions#new', as: :new_user_session
    post 'signin', to: 'devise/sessions#create', as: :user_session
    delete 'signout', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  root 'static_pages#home'

  resources :posts, shallow: true do
    resources :replies
  end

  resources :notifications, only: :index

  get '/', to: 'static_pages#home'
  get 'about', to: 'static_pages#about'

end
