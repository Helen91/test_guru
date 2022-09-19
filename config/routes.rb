Rails.application.routes.draw do
  get "users/new"

  root "tests#index"

  get :singup, to: "users#new"
  get :login, to: "sessions#new"
  get :logout, to: "sessions#logout"

  resources :users, only: :create
  resources :sessions, only: :create

  resources :user_tests, only: %i[show update index] do
    member do
      get :result
    end
  end
  resources :tests, only: %i[index show], shallow: true do
    resources :questions, except: :index do
      resources :answers, except: :index
    end
    member do
      post :start
    end
  end
end
