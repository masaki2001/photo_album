Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "sessions#new"
  post "sessions" => "sessions#create"
  delete "sessions" => "sessions#destroy"
  resources :users do
    resources :photos, only: [:index, :new, :create]
  end
end
