class CreateAddresses < ActiveRecord::Migration[5.2]
  def self.up
    create_table :addresses do |t|
      t.string :name
      t.string :type_place
      t.integer :number
      t.references :merchant
      t.timestamps null: false
    end
  end

  def self.down
    drop_table :addresses
  end
end
