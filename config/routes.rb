Rails.application.routes.draw do
  root "items#index"
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end

  resources :users do
    resources :items
  end


  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
      post 'buy', to: 'card#buy'
      post 'index', to: 'card#index'
    end
  end
  
  resources :items do
    member do
      resources :purchase, only: [:index, :update] do
        collection do
          get 'index', to: 'purchase#index'
          post 'pay', to: 'purchase#pay'
          get 'done', to: 'purchase#done'
        end
      end
    end
  end

  resources :users

end

 
