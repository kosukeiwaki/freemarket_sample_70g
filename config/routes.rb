Rails.application.routes.draw do
  root "items#index"
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
<<<<<<< item-listing-function
  root 'items#index'
  resources :users do
    resources :items
  end
=======

  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
  
  resources :items do
    member do
      get :confirm
    end
  end
  resources :users
>>>>>>> master
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
