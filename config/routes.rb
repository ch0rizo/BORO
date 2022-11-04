Rails.application.routes.draw do
  root to: "pages#home"
  get '/how-it-works', to: 'pages#works'
  devise_for :users
  resources :items do
    resources :lendings, only: %i[create]
    resource :favorite, only: %i[create destroy]
  end
  resources :lendings, only: [] do
    member do
      patch :accept
      patch :decline
    end
  end
  resource :dashboard, only: %i[show update]
end
