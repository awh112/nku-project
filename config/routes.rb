NkuProject::Application.routes.draw do
  resources :lists
  
  root to: 'lists#index'
end
