Rails.application.routes.draw do

  root 'patients#index'

  resources :locations

  resources :patients
end
