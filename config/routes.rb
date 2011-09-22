DssPortal::Application.routes.draw do
  get "site/index"
  get "site/logout"
  get "site/access_denied"

  root :to => "Site#index"
end
