Rails.application.routes.draw do
  root "hello#index"
  resources :posts, only: [:index, :create, :show, :update, :destroy]
end
