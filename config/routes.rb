Rails.application.routes.draw do
  root 'hyperloop#AppRouter'
  mount Hyperloop::Engine => '/hyperloop'
  match '*all', to: 'hyperloop#AppRouter', via: [:get]
end
