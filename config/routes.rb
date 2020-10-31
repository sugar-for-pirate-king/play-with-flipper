Rails.application.routes.draw do
  mount Flipper::UI.app(Flipper) => '/flipper'

  root 'dashboards#index'
end
