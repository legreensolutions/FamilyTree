Familynew::Application.routes.draw do
  resources :interesting_links
  resources :content_managements

  resources :posts
  match 'members/assign_post', :to => "members#assign_post"
#  map.connect 'members/committee_members', :controller => :members, :action => :committee_members
  match 'members/committee_members', :to => 'members#committee_members'
  match 'home/detailed_content', :to => 'home#detailed_content'
  match 'tree', :to => 'members#tree'
  match 'family_tree', :to => 'members#family_tree'

  resources :relations, :collection => {:add_relation=>:get,:find=>:get}
  match "relations/add_relation", :to => 'relations#add_relation' 
  match "relations/find", :to => 'relations#find' 

  match 'galleries/gallery_all', :to => 'galleries#gallery_all'
  resources :galleries


  resources :families
  
  resources :alerts

  resources :news_items, :as=>'news_items'

  resources :events

  resources :events do
    get :autocomplete_event_tags, :on => :collection
  end

  resources :galleries do 
    get :autocomplete_gallery_tags, :on => :collection
  end


  resources :members,:collection => {:display_details=>:get}

  resources :districts

  resources :states

  resources :states

  resources :countries

  resources :countries

  resources :countries


  resource :user_session
 # map.root :controller => "user_sessions", :action => "new"
  root :to =>'home#index'
  match 'contactus',:to =>'home#contact_us'
  match 'guidelines',:to =>'home#guidelines'
  match 'contact-us',:to=>'contact_us#contact_us'
  resources :users
  resource :account, :controller => "users"

  #match 'logout', :to => 'user_sessions#destroy'
  #match 'login', :to => 'user_sessions#new'

  match 'login' => "user_sessions#new",      :as => :login
  match 'logout' => "user_sessions#destroy", :as => :logout

  match '/register/:activation_code', :to => 'activations#activate_account'

  resources :password_resets, :collection => {:change_password =>:get}
                                                match '/simple_captcha/:action', :controller => 'simple_captcha'

# optional, this just sets the root route
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller

  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  match ':controller/:action/:id'
  match ':controller/:action/:id.:format'


end
