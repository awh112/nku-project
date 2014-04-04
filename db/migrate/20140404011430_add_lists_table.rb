class AddListsTable < ActiveRecord::Migration
  def change
    create_table :lists do |l|
      l.string :title
      l.text :description
      
      l.timestamps
    end
  end
end
