Rails.application.routes.draw do
  get 'profile' => 'users#profile'

  get 'users/edit'

  devise_for :users
    resources :posts do
      resources :comments
    end
    root 'posts#index'
end
