Rails.application.routes.draw do
  resources :users

  root to: 'web#top'

  get 'cont/:id', to: 'web#cont'

  get 'top', to: 'web#top'
  get 'list', to: 'web#list'
#  get 'cont', to: 'web#cont'
  get 'cont/:id', to: 'web#cont'
  get 'user', to: 'web#user'
end
