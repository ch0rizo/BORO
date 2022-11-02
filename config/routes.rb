Rails.application.routes.draw do
  root to: "pages#home"
  devise_for :users
  resources :items do
    resources :lendings, only: %i[create]
  end
  resource :dashboard, only: %i[show update]
end
