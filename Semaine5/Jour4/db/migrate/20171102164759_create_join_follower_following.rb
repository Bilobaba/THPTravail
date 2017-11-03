class CreateJoinFollowerFollowing < ActiveRecord::Migration[5.1]
  def change
    create_join_table :followers, :followings do |t|
  end
  end
end
