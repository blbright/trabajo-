Rails.application.routes.draw do
  devise_for :users
  get 'profile' => 'users#profile'
  get 'settings' => 'users#edit'
  resources :users do
    member do
      get :confirm_email
    end
  end
    resources :posts do
      member do
        patch 'vote'
      end
      resources :comments
    end
    root 'posts#index'
end
