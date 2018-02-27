class CreateApplications < ActiveRecord::Migration[5.1]
  def change
    create_table :applications do |t|
      t.references :flat, foreign_key: true
      t.boolean :validation, default: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
