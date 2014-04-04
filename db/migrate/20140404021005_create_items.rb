class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.integer :quantity
      t.references :list
    
      t.timestamps
    end
    
    add_index :items, :list_id
  end
end
