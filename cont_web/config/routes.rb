Rails.application.routes.draw do
  resources :users

  root to: 'web#main'

  get 'cont/:id', to: 'web#cont'

  get 'top', to: 'web#main'

  get 'conf', to: 'web#conf'
  get 'cont/:id', to: 'web#cont'
  get 'user', to: 'web#user'
end
