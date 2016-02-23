Rails.application.routes.draw do
  # root "songs#show"

  root "access#login"

  match ':controller(/:action(/:id))', :via => [:get, :post]
end
