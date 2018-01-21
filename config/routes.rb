Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :todos
  root :to =>'todos#index'
  match 'todos/:id/toggle_status', to: 'todos#toggle_status', via: 'get'
  get "home", to: "home#index", as: "user_root"
  root 'home#index'
end
