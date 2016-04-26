class CreateJoinTableMaterialsTags < ActiveRecord::Migration
  def change
    create_join_table :materials, :tags do |t|
      t.index [:material_id, :tag_id]
      t.index [:tag_id, :material_id]
    end
  end
end
