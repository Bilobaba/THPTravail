class CreateTweets < ActiveRecord::Migration[5.1]
  def change
    create_table :tweets do |t|
      t.string :text
      t.references :author, references: :users

      t.timestamps
    end
  end
end
