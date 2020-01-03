Rails.application.routes.draw do
  get 'dashboard/index'
  resources :documents do
    member do
      post 'download'
    end
  end
  resources :news_categories

  # root_path
  root :to => 'dashboard#index'
end
