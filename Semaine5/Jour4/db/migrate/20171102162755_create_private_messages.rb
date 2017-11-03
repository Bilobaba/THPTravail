class CreatePrivateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :private_messages do |t|
      t.string :text
      t.references :sender, references: :users
      t.timestamps
    end
  end
end
