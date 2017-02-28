Rails.application.routes.draw do

  get 'download/resume', to: 'downloads#download_resume', as: 'download/resume'
  get 'download/video', to: 'downloads#download_video', as: 'download/video'

  mount RailsAdmin::Engine => '/harvardjobs/masteradmin', as: 'rails_admin'
  resources :users
  resources :applicants
  root 'visitors#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
