ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'home', :action => 'index'
  
  map.connect '/adnim/index/:page', :controller => 'adnim', :action => 'index', :page => 1
  map.connect '/adnim/:action/:id', :controller => 'adnim'
  
  map.connect '/rss', :controller => 'home', :action => 'rss'
  map.connect ':year/:month/:day/:slug', :controller => 'post', :action => 'view'
  map.connect '/:category/:page', :controller => 'home', :action => 'index', :category => 'all', :page => 1
end
