Rails.application.routes.draw do
  root 'hyperstack#AppRouter'
  # mount Hyperloop::Engine => '/hyperloop'
  get "/local_docs" => "local_docs#index"
  match '*all', to: 'hyperstack#AppRouter', via: [:get]
end
