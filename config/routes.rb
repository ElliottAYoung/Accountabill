Rails.application.routes.draw do
  get 'tweets/new'

  get 'tweets/create'

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)

  get '/politicians/:zipcode' => "network#politicians", as: "politicians_request"
  get '/politicians/find/:name' => "network#politician_names", as: "politician_name_request"
  get '/contributions/:bio_id' => "network#contributions", as: "contributions_request"
  get '/sectors/:bio_id' => "network#sectors", as: "sectors_request"
  get '/companies/:entity_id' => "network#companies", as: "companies_request"

  get '/industries/:bio_id' => "network#industries", as: "industries_request"

  get '/bills/:bio_id' => "network#bills", as: "bills_request"
  get '/contributor_types/:bio_id' => "network#contributor_types", as: "contributor_types_request"

  get '/politician/:bio_id' => "politician#details", as: "politician_details"

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  
  get 'signout', to: 'sessions#destroy', as: 'signout'
  resources :tweets, only: [:new, :create]
  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]

  root 'page#index'

  get 'bio/:bio', to: 'page#index'
  get 'query/:input', to: 'page#index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
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
end
