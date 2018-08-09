Rails.application.routes.draw do
  root 'hyperloop#AppRouter'
  match '*all', to: 'hyperloop#AppRouter', via: [:get]
end
