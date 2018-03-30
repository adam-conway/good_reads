Rails.application.routes.draw do
  resources :books, only: [:show]

  resources :users do
    resources :reviews
  end

end
