class CreateSales < ActiveRecord::Migration[5.2]
  def self.up
    create_table :sales do |t|
      t.integer :count
      t.float :total
      t.references :purchaser
      t.references :merchant
      t.references :item
      t.timestamps null: false
    end
  end

  def self.down
    drop_table :sales
  end
end
