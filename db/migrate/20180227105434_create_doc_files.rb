class CreateDocFiles < ActiveRecord::Migration[5.1]
  def change
    create_table :doc_files do |t|
      t.references :folder, foreign_key: true
      t.references :doc_category, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
