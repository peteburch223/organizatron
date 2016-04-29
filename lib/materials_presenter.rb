class MaterialsPresenter
  def initialize(params)
    @params = params
  end

  def get_materials
    if @params.has_key?(:tags) && @params[:tags] != ""
      shared_material_ids = shared_materials_from tag_params_for_index
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
    # byebug
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

  def shared_materials_from params
    materials = Material.joins(:tags).where(tags: {name: params}).map(&:id)
    materials.select {|id| materials.count(id) == params.count}
  end


end
