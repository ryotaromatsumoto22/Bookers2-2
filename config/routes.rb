Rails.application.routes.draw do

  root 'homes#home'
  devise_for :users

  devise_scope :user do
  	get '/users/sign_out' => 'devise/sessions#destroy'
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html





  resources :books, only:[:index, :show, :edit, :update, :destroy, :create]

  resources :users, only:[:show, :index, :edit, :update]


  get 'home/about' => 'homes#about' , as: 'about'



end
