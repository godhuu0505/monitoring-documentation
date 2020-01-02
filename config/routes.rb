Rails.application.routes.draw do
  get 'dashboard/index'
  resources :documents
  resources :news_categories
end
