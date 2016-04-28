class ConsolidatedData
  def initialize(params)
    @params = params
  end

  def get_materials
    if @params.has_key?(:tags) && @params[:tags] != ""
      shared_material_ids = get_shared materials_from tag_ids
      mtl_tag_hash = build_tag_votes_hash_from shared_material_ids
      build_materials_array_from(shared_material_ids, mtl_tag_hash).uniq
    else
      Material.all
    end
  end

  private

  def tag_params_for_index
    @params.require(:tags).split(" ")
  end

  def vote_count_for material_tag_link_ids
    Vote.group(:material_tag_link_id).sum(:value)
  end

  def build_tag_votes_hash_from shared_material_ids
    votes_from_material_tag_link = MaterialTagLink.where(material_id: shared_material_ids)
    votes_from_material_tag_link.map(&:id).reduce({}) do |result, mtl_id|
      temp = MaterialTagLink.find(mtl_id).tag.slice(:id, :name)
      temp[:votes] = MaterialTagLink.find(mtl_id).votes.sum(:value)
      result[mtl_id] = temp
      result
    end
  end

  def build_materials_array_from(material_ids, mtl_tag_hash)
    material_ids.reduce([]) do |result, material_id|
      temp = Material.find(material_id).slice(:title, :link_url, :description)
      temp[:id] = material_id
      temp[:tags] = get_material_tags_from(material_id, mtl_tag_hash)
      result << temp
    end
  end

  def get_material_tags_from(material_id, mtl_tag_hash)
    MaterialTagLink.where(material_id:material_id).map do |mtl|
      mtl_tag_hash[mtl.id]
    end
  end

  def tag_ids
    tag_params_for_index.map do |tag|
      found_tag = Tag.find_by name: tag
      found_tag ? found_tag.id : nil
    end
  end

  def materials_from tag_ids
    MaterialTagLink.where(tag_id: tag_ids).map do |link|
      link.material_id
    end
  end

  def get_shared ids
    ids.select do |id|
      ids.count(id) == tag_params_for_index.count
    end
  end

  def get_materials_from ids
    Material.where(id: ids)
  end
end
