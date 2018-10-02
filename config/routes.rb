Rails.application.routes.draw do
  # constraints Clearance::Constraints::SignedIn.new { |user| user.admin? } do
  #   root to: "pages#index", as: :admin_root
  # end
  root 'pages#index'

  # constraints Clearance::Constraints::SignedIn.new do
  #   root to: 'pages#index', as: :signed_in_root
  # end

  # constraints Clearance::Constraints::SignedOut.new do
  #   root to: 'pages#index'
  # end

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

  # get '/:404' => "application#not_found"

  get '/auth/:provider/callback' => 'sessions#create_from_omniauth'
  # match "/auth/:provider/callback" => "sessions#create_from_omniauth"

  
  resources :listings
  resources :listings, :member => { :reserve => :get }
  resources :reservations
  resources :search, controller: "search", only: [:index]

  
  resources :users

  resources :listings do
      resources :listing_images
  end
  post '/listings/:listing_id/listing_images/new' => 'listing_images#create'
  get '/listings/:listing_id/listing_images/new' => 'listing_images#create'
  post '/listings/:listing_id/listing_images/:id/edit' => 'listing_images#edit'
  post '/listings/:listing_id/listing_images/:id' => 'listing_images#update'
  post '/listings/:id' => 'listings#edit'
  # post '/listings/:listing_id/listing_images/edit' => 'listing_images#edit'
  # get '/listings/:listing_id/listing_images/edit' => 'listing_images#edit'

  resources :rooms
  resources :photos

  resources :rooms do
    resources :reservations, only: [:create]
  end

  get '/register', :controller => 'users', :action => 'new'
  get '/login', :controller => 'user_sessions', :action => 'new'
  get '/logout', :controller => 'user_sessions', :action => 'destroy'
  get '/users', :controller => 'users', :action => 'index'
  post '/users/:id' => 'users#edit'


  # get '/search', :controller => 'pages', :action => 'search'

  post '/search' => 'search#search'
  get '/bookings/:id/payment_details'=> "bookings#payment_details", as: :payment_details
  post '/bookings/:id/checkout' => 'bookings#checkout'
    
  resources :bookings, only: [:index, :show, :edit, :destroy]
  # get '/bookings/:id' => 'bookings#book', as: :book
  get '/bookings/:id/dates_confirmation' => 'bookings#dates_confirmation', as: :dates_confirmation
  get '/bookings/:id/book_check' => 'bookings#book_check', as: :book_check
  get '/bookings/:id/book_confirmation' => 'bookings#book_confirmation', as: :book_confirmation
  post '/bookings/:id/book_finalization' => 'bookings#book_finalization', as: :book_finalization

  concern :paginatable do
    get '(page/:page)', action: :index, on: :collection, as: 'page'
  end
  resources :listings, concerns: :paginatable

  # AJAX ROUTES
  post 'listings/:id/delete_photo' => 'listings#delete_photo'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end



  # get '/preload' => 'reservations#preload'
  # resources :users, controller: "users", only: [:create] do
  #   resource :password, # doesnt generate id for password
  #     controller: "clearance/passwords",
  #     only: [:create, :edit, :update]
  # end

end


