Rails.application.routes.draw do
  get 'gifts/show'
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :wishlists, only: [:show, :edit] do
    resources :usercommits, only: [:create]
    resources :gifts_wishlists, only: [:create]
  end

  resources :gifts_wishlists, only: :update

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end

  resources :gifts, only: :show do
      member do
        get 'commit_gift'
      end
    end

    resources :events do
      resources :invitations, only: :create
    end
  end

  # migration to add user_id to gifts_wishlist
  # add route for gifts_wishlists [update maybe a show as well] DONE
  # tidy up the app for the new routes
  # then we need to add a form with hidden fields to gifts_wishlist
  # make sure the routes are working
