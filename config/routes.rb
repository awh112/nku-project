NkuProject::Application.routes.draw do
  resources :lists do
    resources :items
  end
  resources :shoppings
  
  root to: 'lists#index'
end
