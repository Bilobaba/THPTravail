class AddDealWithToDoctors < ActiveRecord::Migration[5.1]
  def change
    add_reference :doctors, :deal_with, foreign_key: true
  end
end
