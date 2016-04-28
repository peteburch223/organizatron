def link_material_with_tag(material_tag_link, material, tag)
  material_tag_link.material = material
  material_tag_link.tag = tag
  material_tag_link.save
end

def link_mtl_with_vote(material_tag_link, vote)
  material_tag_link.votes << vote
  material_tag_link.save
end
