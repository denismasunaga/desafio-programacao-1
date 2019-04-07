class CreateMerchants < ActiveRecord::Migration[5.2]
  def self.up
    create_table :merchants do |t|
      t.string :name
      t.timestamps null: false
    end
  end

  def self.down
    drop_table :merchants
  end
end
