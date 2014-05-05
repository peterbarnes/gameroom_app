class Addnumbertostores < ActiveRecord::Migration
  def change
    add_column :stores, :number, :string
  end
end
