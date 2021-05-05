Rails.application.routes.draw do
  devise_for :users
  
  root to: "products#index" #ルートパスへのアクセスがあったら、products_controllerのindexアクションが呼び出される
  resources :products, only: [:index, :new, :create, :show, :edit, :update] do
  end
  
  
end
