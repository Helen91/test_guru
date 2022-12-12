Rails.application.routes.draw do
  
  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }
  root "tests#index"

  resources :user_tests, only: %i[show update index] do
    member do
      get :result
      post :gist

    end
  end
  resources :tests, only: :index do
    member do
      post :start

    end
  end

  namespace :admin, shallow: true do
    get 'gists', to: "gists#index"
    resources :tests do
      resources :questions, except: :index do
        resources :answers, except: :index
      end
      patch :update_inline, on: :member
    end
  end

  get 'feedback', to: "feedback#new"
  post 'feedback', to: "feedback#create"
end
