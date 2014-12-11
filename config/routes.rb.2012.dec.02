ActionController::Routing::Routes.draw do |map|

  map.resources :content_managements

  map.resources :posts
  map.connect 'members/committee_members', :controller => :members, :action => :committee_members
  map.tree 'tree', :controller => 'members', :action => 'tree'
  map.family_tree 'family_tree', :controller => 'members', :action => 'family_tree'
  map.resources :relations, :collection => {:add_relation=>:get,:find=>:get}
  map.connect 'galleries/gallery_all', :controller => 'galleries', :action => 'gallery_all'
  map.resources :galleries


  map.resources :families

  map.resources :alerts

  map.resources :news_items,:as=>'news'

  map.resources :events

  map.resources :members

  map.resources :districts

  map.resources :states

  map.resources :states

  map.resources :countries

  map.resources :countries

  map.resources :countries

  map.resource :user_session
 # map.root :controller => "user_sessions", :action => "new"
 map.root :controller=>'home',:action=>'index'
  map.contact_us 'contactus',:controller=>'home',:action=>'contact_us'
  map.guidelines 'guidelines',:controller=>'home',:action=>'guidelines'
  map.contact_us 'contact-us',:controller=>'contact_us',:action=>'contact_us'
  map.resources :users
  map.resource :account, :controller => "users"

   map.logout 'logout', :controller => 'user_sessions', :action => 'destroy'
  map.login 'login', :controller => 'user_sessions', :action => 'new'
  map.register '/register/:activation_code', :controller => 'activations', :action => 'activate_account'

  map.resources :password_resets, :collection => {:change_password =>:get}
  map.simple_captcha '/simple_captcha/:action', :controller => 'simple_captcha'

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
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end

