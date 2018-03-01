Rails.application.routes.draw do
  root 'households#index'

  resources :households do
    resources :items
  end
end
