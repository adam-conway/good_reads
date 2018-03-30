Rails.application.routes.draw do
  resources :books, only: [:show]

  resources :users, only: [:create, :new] do
    resources :reviews, only: [:create, :new]
  end

end
