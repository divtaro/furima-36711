Rails.application.routes.draw do
  devise_for :users
  # get 'items/index ←コントローラー作成時に自動で作成された
  root to: "items#index"
  resources :items, only: [:index, :new, :create, :show]
end