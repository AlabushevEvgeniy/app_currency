Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'custom_rates#show'
  get 'admin', to: 'custom_rates#new'
  resources :custom_rates, only: [:new, :create, :show]

  mount ActionCable.server => '/cable'
end
