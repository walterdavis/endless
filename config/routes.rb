Rails.application.routes.draw do
  resources :projects
  get 'assets/:original_id/versions/:version', to: 'assets#version'
  resources :assets, only: :destroy
  root 'projects#index'
end
