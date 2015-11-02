Rails.application.routes.draw do

  devise_for :views
  devise_for :users
  root 'welcome#index'

  # devise_for :users, controllers: { sessions: 'users/sessions' }
end
