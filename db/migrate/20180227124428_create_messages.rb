class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.references :flat, foreign_key: true
      t.text :content
      t.boolean :read, default: false
      t.references :sender
      t.references :recipient
      t.timestamps
    end
    add_foreign_key :messages, :users, column: :sender_id, primary_key: :id
    add_foreign_key :messages, :users, column: :recipient_id, primary_key: :id
  end
end
