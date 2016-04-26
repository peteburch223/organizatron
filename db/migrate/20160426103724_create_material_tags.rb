class CreateMaterialTags < ActiveRecord::Migration
  def change
    create_table :material_tags do |t|

      t.timestamps null: false
    end
  end
end
