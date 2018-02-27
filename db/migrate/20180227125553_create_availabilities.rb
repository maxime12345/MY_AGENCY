class CreateAvailabilities < ActiveRecord::Migration[5.1]
  def change
    create_table :availabilities do |t|
      t.references :flat, foreign_key: true
      t.date :start_time
      t.boolean :visit_confirmed, default: false

      t.timestamps
    end
  end
end
