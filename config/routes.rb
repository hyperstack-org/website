Rails.application.routes.draw do
  root 'hyperloop#AppRouter'
  mount Hyperloop::Engine => '/hyperloop'
  get "/local_docs" => "local_docs#index"
  match '*all', to: 'hyperloop#AppRouter', via: [:get]
end
