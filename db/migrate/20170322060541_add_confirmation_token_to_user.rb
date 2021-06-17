class AddConfirmationTokenToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :confirmation_token, :string
    add_column :users, :confirmation_sent_at, :datatime

  end
end
