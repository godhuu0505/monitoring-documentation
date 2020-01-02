json.extract! news_category, :id, :name, :created_at, :updated_at
json.url news_category_url(news_category, format: :json)
