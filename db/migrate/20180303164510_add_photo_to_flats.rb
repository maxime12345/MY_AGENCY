class AddPhotoToFlats < ActiveRecord::Migration[5.1]
  def change
    add_column :flats, :photo, :string
  end
end
