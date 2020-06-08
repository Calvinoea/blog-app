Rails.application.routes.draw do
  root to: 'articles#index'
  resources :articles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :articles do
    resources :comments
  end
  resources :tags
end

Blogger::Application.routes.draw do
  # ... other resources we have defined ...
  resources :authors

  resources :author_sessions, only: %i[new create destroy]
  get 'login' => 'author_sessions#new'
  get 'logout' => 'author_sessions#destroy'
end
