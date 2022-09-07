Rails.application.routes.draw do
  resources :user_tests
  resources :tests, shallow: true do
    resources :questions
  end
end
