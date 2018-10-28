Rails.application.routes.draw do
  # root 'hyperstack#AppRouter'
  root 'hyperstack#TestMe'
  # mount Hyperloop::Engine => '/hyperloop'
  get "/local_docs" => "local_docs#index"
  match '*all', to: 'hyperstack#TestMe', via: [:get]
end
