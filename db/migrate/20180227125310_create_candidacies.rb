class CreateCandidacies < ActiveRecord::Migration[5.1]
  def change
    create_table :candidacies do |t|
      t.references :flat, foreign_key: true
      t.string :status, default: "En attente"
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
