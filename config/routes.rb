Rails.application.routes.draw do
  root to: "users#index"
  resources :users, only: [:create, :new, :index, :show] do
    resources :goals, only: [:create, :new]
  end
  resources :goals, only: [:update, :show]
  resources :comments, only: [:create, :destroy]
  resource :session, only: [:new, :create, :destroy]

end
