Rails.application.routes.draw do
  root to: "pages#home"
  devise_for :users
  resources :items do
    resources :lendings, only: %i[create]
  end
  resources :lendings, only: [] do
    member do
      patch :accept
      patch :decline
    end
  end
  resource :dashboard, only: %i[show update]
end
