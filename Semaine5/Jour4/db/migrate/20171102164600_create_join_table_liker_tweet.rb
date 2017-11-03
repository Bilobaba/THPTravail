class CreateJoinTableLikerTweet < ActiveRecord::Migration[5.1]
  def change
    create_join_table :likers, :tweets do |t|
      # t.index [:liker_id, :tweet_id]
      # t.index [:tweet_id, :liker_id]
    end
  end
end
