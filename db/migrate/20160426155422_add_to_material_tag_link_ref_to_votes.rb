class AddToMaterialTagLinkRefToVotes < ActiveRecord::Migration
  def change
    add_reference :votes, :material_tag_link, index: true
  end
end
