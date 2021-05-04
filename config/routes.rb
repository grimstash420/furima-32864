Rails.application.routes.draw do
  devise_for :users
  get 'products/index'
  root to: "products#index" #ルートパスへのアクセスがあったら、products_controllerのindexアクションが呼び出される
  resources :products, only: [:index, :new, :create] do
  end
end
