Tour::Application.routes.draw do
  root to: "top#index"

  resources :members do
  end

  resources :trips do
    collection { get "search" }
  end

  resources :details

  resources :reviews

  resources :reservations do
    collection { post "confirmation" }
    collection { get "canceld" }
  end

  resource :session, only: [:show, :create, :destroy]

  namespace :admin do
    root to: "top#index"
    resources :trips do
      collection { get "search" }
    end
    resources :details do
      collection { post "copy" }
    end
    resources :reviews
    resources :reservations
  end
end
