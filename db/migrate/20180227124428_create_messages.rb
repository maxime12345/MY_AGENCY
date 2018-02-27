class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.references :flat, foreign_key: true
      t.text :content
      t.boolean :read, default: false
      t.references :sender
      t.references :recipient
      add_foreign_key :private_messages, :users, column: :sender_id, primary_key: :id
      add_foreign_key :private_messages, :users, column: :recipient_id, primary_key: :id

      t.timestamps
    end
  end
end
