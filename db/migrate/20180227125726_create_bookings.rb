class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.references :availability, foreign_key: true
      t.references :candidacy, foreign_key: true

      t.timestamps
    end
  end
end
