Rails.application.routes.draw do
  get 'groups/new'
  get 'groups/index'
  get 'groups/create'
  get 'groups/edit'
  get 'groups/update'
  get 'groups/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users

  root :to => "homes#top"
  get "home/about" => "homes#about"

  resources :books, only: [:index, :show, :edit, :create, :destroy, :update] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  
  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get "followings" => "relationships#followings"
    get "followers" => "relationships#followers"
  end
  
  get "searches" => "searches#search"
  
end
