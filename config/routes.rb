Rails.application.routes.draw do
  get 'dashboard/index'
  resources :documents
  resources :news_categories

  # root_path
  root :to => 'dashboard#index'
end
