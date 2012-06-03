Imls::Application.routes.draw do
  root :to => "catalog#index"

  Blacklight.add_routes(self)

  devise_for :users

end
