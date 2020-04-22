Rails.application.routes.draw do
  resources :sessions, only: [:create]
  resources :registrations, only: [:create]
  resources :records, only: [:create, :index]
  delete :logout, to: "sessions#logout"
  post :logged_in, to: "sessions#logged_in"
  root 'welcome#index'
end
