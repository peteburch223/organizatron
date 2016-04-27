class AddMaterialRefToMaterialTagLinks < ActiveRecord::Migration
  def change
    add_reference :material_tag_links, :material, index: true
  end
end
