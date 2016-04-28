class MaterialsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index

    # tag_params_for_index.nil?
    # puts "Parameters: #{tag_params_for_index}"
    if tag_params_for_index
      mtl_tag_hash = build_tag_votes_hash
      material_ids = materials_from tag_ids
      shared_material_ids = get_shared material_ids
      materials = build_materials_array_from(shared_material_ids, mtl_tag_hash).uniq
    else
      materials = Material.all
    end
    render json: materials
  end

  def create
    material = Material.new(material_params_for_create)

    tag_params_for_create.each do |t|
      material.tags << Tag.create( name: t )
    end

    if material.save
      render json: material, status: :created
    end
  end

  private

  def material_params_for_create
    params.require(:material).permit(:title, :description, :link_url)
  end

  def tag_params_for_index
    p params[:tags]
    
    params.require(:tags).split(" ") if params[:tags]
  end

  def tag_params_for_create
    params.require(:tags).split(",")
  end

  def vote_count_for material_tag_link_ids
    Vote.group(:material_tag_link_id).sum(:value)
  end

  def build_tag_votes_hash

    material_tag_link_ids = MaterialTagLink.all.map(&:id)
    result = {}

    material_tag_link_ids.map do |mtl_id|
      temp ={}

      temp[:id] = MaterialTagLink.find(mtl_id).tag.id
      temp[:name] = MaterialTagLink.find(mtl_id).tag.name
      temp[:votes] = MaterialTagLink.find(mtl_id).votes.sum(:value)
      result[mtl_id] = temp

    end
    return result
  end


  def build_materials_array_from(material_ids, mtl_tag_hash)
    result = []
    material_ids.each do |material_id|
      temp = {}
      temp[:id] = material_id
      temp[:link_url] = Material.find(material_id).link_url
      temp[:title] = Material.find(material_id).title
      temp[:description] = Material.find(material_id).description

      mtls = MaterialTagLink.where(material_id:material_id)

      temp[:tags] = mtls.map do |mtl|
        mtl_tag_hash[mtl.id]
      end

      result << temp
    end
    return result
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
