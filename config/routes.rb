Rails.application.routes.draw do
  get 'gifts/show'
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :events do
    resources :whislists, only: :show do
      resources :gifts, only: :show
    end
  end
end
