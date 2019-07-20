Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'course_entries#current'
  get 'admin', to: 'course_entries#new'
  resources :course_entries, only: [:new, :create]
end
