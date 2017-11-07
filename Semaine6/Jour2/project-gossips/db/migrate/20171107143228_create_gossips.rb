class CreateGossips < ActiveRecord::Migration[5.1]
  def change
    create_table :gossips do |t|
      t.references :moussaillon, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
