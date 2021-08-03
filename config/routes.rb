Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  root 'homes#top'
  devise_for :users
  get 'home/about' => 'homes#about'
  resources :users,only: [:show, :index, :edit, :update]
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
end