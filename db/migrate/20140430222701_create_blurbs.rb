class CreateBlurbs < ActiveRecord::Migration
  def change
    create_table :blurbs do |t|
      t.string :title
      t.string :desc

      t.timestamps
    end
  end
end
