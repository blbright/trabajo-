Rails.application.routes.draw do
  devise_for :users
  get 'profile' => 'users#profile'
  get 'users/edit'
  get '/imgone' => 'users#delete'
  resources :users do
    member do
      get :confirm_email
    end
  end
  resources :users
   resources :posts do
    resources :comments
   end
    root 'posts#index'
end
