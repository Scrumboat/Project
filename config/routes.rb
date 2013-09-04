Venerekisteri::Application.routes.draw do

  resources :summaries


  resources :employments

  get '/payments/survey', to: 'payments#survey_index'
  get '/payments/:id/survey', to: 'payments#survey'
  post '/payments/:id/survey', to: 'payments#survey_done', as: :survey_done
  post '/invoices/uploadFile', to: 'invoices#uploadFile'
  resources :invoices do
    resources :payments
  end

  resources :boats do
    get :autocomplete_member_nimi, :on => :collection
	get :autocomplete_member_jno, :on => :collection
  end
  resources :pricings


  resources :dockyards do
    resources :dockyard_spots
  end

  resources :storages

  resources :boats_members

  resources :docks do    
    resources :berths
  end

  resources :guardseasons do
    resources :guardturns
  end
  
  resources :queuings

  resources :docks

  resources :berths

  resources :ownerships

  #get "home#index"

  devise_for :admins, :controllers => {:registrations => "registrations"}
  
  resources :boats

  resources :models

  resources :members


  root :to => "home#index"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
