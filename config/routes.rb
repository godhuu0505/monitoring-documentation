Rails.application.routes.draw do
  get 'dashboard/index'
  resources :documents
  resources :news_categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
