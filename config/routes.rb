OpenMyMind::Application.routes.draw do
  
  match '/adnim/index/:page' => 'adnim#index'
  match '/adnim/(:action)(/:id)' => 'adnim'
  
  match '/rss' => 'home#rss'
  match ':year/:month/:day/:slug' => 'post#view'
  match '/:category/(:page)' => 'home#index'
  
  root :to => 'home#index'
end
