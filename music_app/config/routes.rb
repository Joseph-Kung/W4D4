Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:new, :create, :update, :show]

  resource :session, only: [:new, :create, :destroy]

  resources :bands, only: [:new, :index, :create, :show, :update, :destroy, :edit] do
    resources :albums, only: [:new]
  end

  resources :albums, only: [:create, :edit, :show, :update, :destroy]
end
