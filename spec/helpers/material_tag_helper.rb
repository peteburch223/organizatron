def link_material_with_tag(material_tag_link, material, tag)
  material_tag_link.material = material
  material_tag_link.tag = tag
  material_tag_link.save
end

def link_mtl_with_vote(material_tag_link, vote)
  material_tag_link.votes << vote
  material_tag_link.save
end

def tags_for(material)
  material.tags.map do |tag|
    temp = {}
    temp['id'] = tag.id
    temp['name'] = tag.name
    temp['votes'] = tag.material_tag_links.reduce(0) do |result, mtl|
      result +=  ((material.material_tag_links.include? mtl) ? mtl.votes.sum(:value) : 0)
    end
    temp
  end
end
