class CreateDocumentData < ActiveRecord::Migration[5.2]
  def change
    create_table :document_data do |t|
      t.belongs_to :document, index: true
      t.string :file_name
      t.string :document_type

      t.timestamps
    end
  end
end
