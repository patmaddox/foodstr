ActionController::Routing::Routes.draw do |map|
  map.resources :users
  map.resources :restaurants do |restaurant|
    restaurant.resources :menu_items
  end
  map.resource :sessions
  
  map.homepage '', :controller => 'main', :action => 'homepage'
  map.dashboard '/dashboard', :controller => 'users', :action => 'dashboard'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
end
