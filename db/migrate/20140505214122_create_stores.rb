class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :title
      t.string :hours
      t.string :address
      t.string :gmap
      t.string :icon

      t.timestamps
    end
  end
end
