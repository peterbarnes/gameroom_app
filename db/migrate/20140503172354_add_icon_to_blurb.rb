class AddIconToBlurb < ActiveRecord::Migration
  def change
    add_column :blurbs, :icon, :string
  end
end
