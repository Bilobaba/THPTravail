class CreateJoinTableEventUser < ActiveRecord::Migration[5.1]
  def change
    create_join_table :events, :users do |t|
      t.index [:event_id, :user_id], unique: true
      t.index [:user_id, :event_id], unique: true

      # add_index :categories_posts, [ :category_id, :post_id ], :unique => true, :name => 'by_category_and_post'

    end
  end
end
