Rails.application.routes.draw do
  resources :user_tests, only: %i[show update] do
    member do
      get :result
    end
  end
  resources :tests, shallow: true do
    resources :questions
    member do
      post :start
    end
  end
end
