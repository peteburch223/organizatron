class CreateMaterialTagLinks < ActiveRecord::Migration
  def change
    create_table :material_tag_links do |t|
      t.timestamps null: false
    end
  end
end
