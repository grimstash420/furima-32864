Rails.application.routes.draw do
  devise_for :users
  get 'items/index'
  root to: "items#index" #ルートパスへのアクセスがあったら、items_controllerのindexアクションが呼び出される
  
end
