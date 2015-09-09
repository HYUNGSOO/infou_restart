Rails.application.routes.draw do
  get 'main/index'

  devise_for :users, controllers: {
    registrations: 'users/registrations', confirmations: 'users/confirmations'
  }
  
  
  devise_scope :user do
    authenticated :user do
      root 'main#index', as: :authenticated_root
    end
    
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
end
