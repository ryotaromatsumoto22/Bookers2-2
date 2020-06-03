Rails.application.routes.draw do


  root 'homes#home'
  devise_for :users

  devise_scope :user do
  	get '/users/sign_out' => 'devise/sessions#destroy'
  end



  


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html





  resources :books, only: [:index, :show, :edit, :update, :destroy, :create] do
  	resource :post_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

  resources :users, only:[:show, :index, :edit, :update]

  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す
  get 'user/:id/follows' => 'relationships#follows', as: 'follows'
  get 'user/:id/followers' => 'relationships#followers', as: 'followers'

  get 'home/about' => 'homes#about' , as: 'about'
  get '/search' => 'searchs#search' , as: 'search'



end
