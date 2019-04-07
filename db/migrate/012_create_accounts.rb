class CreateAccounts < ActiveRecord::Migration[5.2]
  def self.up
    create_table :accounts do |t|
      t.string :name
      t.string :email
      t.string :role
      t.string :uid
      t.string :provider
      t.timestamps null: false
    end
  end

  def self.down
    drop_table :accounts
  end
end
