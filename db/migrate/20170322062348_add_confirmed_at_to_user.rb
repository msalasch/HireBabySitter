class AddConfirmedAtToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :confirmed_at, :datatime
  end
end
