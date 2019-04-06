Rails.application.routes.draw do
  root 'hyperstack#AppRouter'
  mount Hyperstack::Engine => '/hyperstack'
  get '/local_docs' => 'local_docs#index'
  get '/question' => 'question#index'
  get '/questions' => 'question#questions'
  get '/slack' => 'slack#index'
  get '/slack-invite' => 'slack#invite'
  get '/slack-join' => 'slack#join'
  match '*all', to: 'hyperstack#AppRouter', via: [:get]
end
