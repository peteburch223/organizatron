class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.string :link_url
      t.string :title
      t.string :description

      t.timestamps null: false
    end
  end
end
