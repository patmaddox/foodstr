ActionController::Routing::Routes.draw do |map|
  map.resources :users
  map.homepage_url '', :controller => 'main', :action => 'homepage'
end
