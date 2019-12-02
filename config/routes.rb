Rails.application.routes.draw do
   get 'commentings/create'
  devise_for :users
  resources :comments
  resources :posts
  resources :posts do
  resources :commentings 
  end
 root "posts#home"
 
 
 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
