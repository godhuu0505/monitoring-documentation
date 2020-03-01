class AddMd5AndNoteToDocumentData < ActiveRecord::Migration[6.0]
  def change
    add_column :document_data, :md5sum, :string, after: :document_type
    add_column :document_data, :note, :text, after: :md5sum
  end
end
