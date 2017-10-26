class CreateCommentaires < ActiveRecord::Migration[5.1]
  def change
    create_table :commentaires do |t|
      t.string :texte
      t.references :user, foreign_key: true
      t.references :pin, foreign_key: true

      t.timestamps
    end
  end
end
