Rails.application.routes.draw do
  resources :listings
  # constraints Clearance::Constraints::SignedIn.new { |user| user.admin? } do
  #   root to: "pages#index", as: :admin_root
  # end
  root 'pages#index'

  constraints Clearance::Constraints::SignedIn.new do
    root to: 'pages#index', as: :signed_in_root
  end

  constraints Clearance::Constraints::SignedOut.new do
    root to: 'pages#index'
  end

  resources :passwords, controller: "clearance/passwords", only: [:create]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "users", only: [:create, :new] do
    resource :password, # doesnt generate id for password
      controller: "passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "sessions#new", as: nil
  delete "/sign_out" => "sessions#destroy", as: nil
  get "/sign_out" => "sessions#destroy", as: nil
  get "/sign_up" => "users#new", as: nil

  get '/:404' => "application#not_found"

  get '/auth/:provider/callback' => 'sessions#create_from_omniauth'
  # match "/auth/:provider/callback" => "sessions#create_from_omniauth"


  
  # resources :users, only: :show

  # resources :rooms
  # resources :photos

  # resources :rooms do
  #   resources :reservations, only: [:create]
  # end

  # get '/preload' => 'reservations#preload'
  # resources :users, controller: "users", only: [:create] do
  #   resource :password, # doesnt generate id for password
  #     controller: "clearance/passwords",
  #     only: [:create, :edit, :update]
  # end

  
end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # devise_for :users,
  #            path: '',
  #            path_names: {sign_in: 'login', sign_out: 'logout', edit: 'profile'},
  #            controllers: {
  #                omniauth_callbacks: 'omniauth_callbacks',
  #                registrations: 'registrations'
  #            }
