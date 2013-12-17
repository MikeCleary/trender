Trender::Application.routes.draw do
  
  root to: 'trends#map'
  
  get 'trends/trends_by_region'
  get 'trends/locations'

  get '/auth/twitter/callback', :to => 'readers#create'
  post 'reading_lists/add_story/:id', :to => 'reading_lists#add_story'

  get 'searches/search'

  resources :readers, :only => [:index, :show] do
    member do 
      get :reading_lists
    end
    resources :comments, :only => [:index]
  end
  
  resources :trends, :only => [:show]
  resources :reading_lists, :only => [:update, :show, :index, :destroy] do 
    resources :comments, :only => [:create]
    member do   
      post :add_follow
      delete :remove_follow
    end
  end

  # get 'readers/authorise_twitter' , :as => :login_with_twitter
  # get 'readers/twitter_authorisation_callback', :as => :twitter_authorisation_callback
  # # The priority is based upon order of creation: first created -> highest priority.
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
