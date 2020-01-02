json.extract! document, :id, :name, :url, :created_at, :updated_at
json.url document_url(document, format: :json)
