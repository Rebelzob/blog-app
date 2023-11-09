Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:create, :new, :destroy]
      resources :likes, only: [:create, :new]
    end
  end

  root to: redirect('/users/sign_in')

  get "up" => "rails/health#show", as: :rails_health_check
end
