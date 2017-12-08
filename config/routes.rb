Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  devise_for :users
  root "rooms#index"
  resources :rooms do
    resources :messages
  end
end
