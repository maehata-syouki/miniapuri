Rails.application.routes.draw do
  devise_for :users
  root "blogs#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'blogs#index'
  # get 'blogs' => 'blogs#index'
  # get 'blogs/new' => 'blogs#new'
  # post 'blogs' => 'blogs#create'
  resources :users, only: [:show]

  resources :blogs do
    resources :comments, only: [:create]
  end
end
