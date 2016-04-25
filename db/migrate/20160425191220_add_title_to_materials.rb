class AddTitleToMaterials < ActiveRecord::Migration
  def change
    add_column :materials, :title, :string
  end
end
