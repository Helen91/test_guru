Rails.application.routes.draw do
  resources :user_tests, only: %i[show update] do
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
