class AddIcon < ActiveRecord::Migration
  def change
    add_column :links, :icon, :string
  end
end
