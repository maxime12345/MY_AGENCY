class CreateFlats < ActiveRecord::Migration[5.1]
  def change
    create_table :flats do |t|
      t.string :name
      t.string :address
      t.integer :price
      t.references :user, foreign_key: true
      t.text :description
      t.date :publication_date
      t.integer :surface
      t.integer :nb_rooms
      t.string :ad_url
      t.integer :visit_capacity

      t.timestamps
    end
  end
end
