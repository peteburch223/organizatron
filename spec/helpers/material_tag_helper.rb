def link_material_with_tag(material_tag, material, tag)
  material_tag.material = material
  material_tag.tag = tag
  material_tag.save
end
