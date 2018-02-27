class CreateDiscussions < ActiveRecord::Migration[5.1]
  def change
    create_table :discussions do |t|
      t.references :application, foreign_key: true

      t.timestamps
    end
  end
end
