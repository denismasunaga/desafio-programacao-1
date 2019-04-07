class CreatePurchasers < ActiveRecord::Migration[5.2]
  def self.up
    create_table :purchasers do |t|
      t.string :name
      t.string :surname
      t.timestamps null: false
    end
  end

  def self.down
    drop_table :purchasers
  end
end
