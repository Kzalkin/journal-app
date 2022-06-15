Rails.application.routes.draw do
  devise_scope :user do
    root 'devise/sessions#new'
  end
  devise_for :users
  get "/categories/upcoming", to: "categories#upcoming", as: "upcoming_tasks"
  get "/categories/delayed", to: "categories#delayed", as: "delayed_tasks"
  resources :categories do
    resources :tasks
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
