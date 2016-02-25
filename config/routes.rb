Rails.application.routes.draw do

  root "access#login"
  get '/soundcloud/connect', :to => 'soundcloud#connect'
  get 'soundcloud/oauth-callback', to: 'soundcloud#connected'
  get 'logout', to: 'soundcloud#destroy', as: 'logout'
  # get 'soundcloud/connected'
  # get 'soundcloud/destroy'

  match ':controller(/:action(/:id))', :via => [:get, :post, :patch, :delete]
end
