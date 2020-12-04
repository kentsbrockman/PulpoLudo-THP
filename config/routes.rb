Rails.application.routes.draw do
  
  root to: 'game_sheets#index'
  
  resources :game_sheets, only: [:index, :show] do
    resources :game_pictures, only: [:create]
  end

  devise_for :users

  resources :users do
    resources :avatars, only: [:create]
    resources :addresses, except: [:show]
    resources :orders, only: [:index, :create] do
      resources :shippings, only: [:show, :update]
    end
  end

  resources :carts, only: [:show, :update]

  resources :subscriptions
  resources :games, only: [:update]
  

  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
    get 'success', to: 'checkout#success', as: 'checkout_success'
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
