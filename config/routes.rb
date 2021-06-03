Rails.application.routes.draw do
  get 'search/search'
  devise_for :users
  root 'homes#top'
  get 'home/about' => 'homes#about'
  get 'search' => "search#search"

  resources :users,only: [:show,:index,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
  get 'followings' => 'relationships#followings', as: 'followings'
  get 'followers' => 'relationships#followers', as: 'followers'
  end
  resources :books do
   resources :book_comments,only: [:create, :destroy]
   resource :favorites, only: [:create, :destroy]
  end

end