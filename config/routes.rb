Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :articles # , only: [:show, :index, :new, :create, :edit, :update, :delete]
  root "pages#home"
  #get "articles/show" => "articles#show"
  #get "articles" => "articles#index"
  get "signup" => "users#new"
  # post "users" => 'users#create'
  resources:users, except: [:new]
end
