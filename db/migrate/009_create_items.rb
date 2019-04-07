class CreateItems < ActiveRecord::Migration[5.2]
  def self.up
    create_table :items do |t|
      t.string :description
      t.float :price
      t.references :merchant
      t.timestamps null: false
    end
  end

  def self.down
    drop_table :items
  end
end
