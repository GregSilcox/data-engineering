Rails.application.routes.draw do
  resources :data_files, only: [ :show, :new, :create ]
  root 'data_files#new'
end
