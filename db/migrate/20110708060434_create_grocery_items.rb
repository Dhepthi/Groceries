class CreateGroceryItems < ActiveRecord::Migration
  def self.up
    create_table :grocery_items do |t|
      t.integer :list_id
      t.string :name
      t.string :quantity
      t.boolean :bought

      t.timestamps
    end
  end

  def self.down
    drop_table :grocery_items
  end
end
