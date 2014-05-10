class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|

      t.string :name
      t.string :desc
      t.string :icon

      t.timestamps
    end
  end
end