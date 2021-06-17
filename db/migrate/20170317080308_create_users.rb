class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :name
      t.string :last_name
      t.string :phone
      t.string :location
      t.string :schedule
      t.string :hour
      t.integer :type
      t.string :confirmation_token
      t.datetime :confirmation_sent_at
      t.timestamps
    end
  end
end
