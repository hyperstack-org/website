Rails.application.routes.draw do
  root 'hyperstack#AppRouter'
  # root 'hyperstack#TestMe'
  mount Hyperstack::Engine => '/hyperstack'
  get "/local_docs" => "local_docs#index"
  match '*all', to: 'hyperstack#AppRouter', via: [:get]
end
