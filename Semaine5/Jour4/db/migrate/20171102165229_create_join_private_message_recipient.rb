class CreateJoinPrivateMessageRecipient < ActiveRecord::Migration[5.1]
  def change
    create_table :join_private_message_recipients do |t|
      t.string :private_message
      t.string :recipient
    end
  end
end
