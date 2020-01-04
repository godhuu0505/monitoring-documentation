class Document < ApplicationRecord
  has_many :document_datum, dependent: :destroy
end
