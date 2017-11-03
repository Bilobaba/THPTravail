class CreateFollows < ActiveRecord::Migration[5.1]
  def change
    create_table :follows do |t|
      t.references :follower, references: :users
      t.references :followee, references: :users

      t.timestamps
    end
  end
end
