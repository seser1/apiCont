Rails.application.routes.draw do
  resources :users

  #Show top page.
  root to: 'web#main'
  get 'top', to: 'web#main'

  #Show contest's detail which contestID is :id.
  get 'cont/:id', to: 'web#cont'

  #Show contest's configure page.
  get 'conf', to: 'web#conf'
  get 'cont/:id', to: 'web#cont'
  get 'user', to: 'web#user'


  #-----API---------
  #Return contest's status(json formatted) which contestID is :id.
  get 'api/stat/:cont_id', to: 'api#stat'

  #Update contest's status which contestID is :id.
  get 'api/update/:cont_id', to: 'api#update'

end
