Rails.application.routes.draw do
  resources :users
  get 'top', to: 'web#top'
  get 'list', to: 'web#list'
  get 'cont', to: 'web#cont'
  get 'user', to: 'web#user'
  
  get 'main', to: 'engine#main'
end
