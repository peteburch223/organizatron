class AddTagRefToMaterialTagLinks < ActiveRecord::Migration
  def change
    add_reference :material_tag_links, :tag, index: true
  end
end
