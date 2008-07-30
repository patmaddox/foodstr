ActionController::Routing::Routes.draw do |map|
  map.resources :users
  map.resources :restaurants
  map.homepage '', :controller => 'main', :action => 'homepage'
  map.dashboard '/dashboard', :controller => 'users', :action => 'dashboard'
  map.login '/login', :controller => 'sessions', :action => 'new'
end
