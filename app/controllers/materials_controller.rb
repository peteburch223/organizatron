class MaterialsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    material_ids = linked_materials_from get_tag_ids
    shared_material_ids = get_shared material_ids
    render json: (get_materials_from shared_material_ids.uniq)
  end

  def create
    tags = params['material']['tags']

    material = Material.new(material_params)
    # tags.each { |t| material.tags << Tag.create( name: t['name'] ) }
    tags.each { |t| material.tags << Tag.create( name: t ) }

    if material.save
      render json: material, status: :created
    end
  end

  private

  def material_params
    params.require(:material).permit(:title, :description, :link_url)
  end

  def tag_params
    params.require(:tags).split(" ")
  end

  def get_tag_ids
    tag_params.map do |tag|
      found_tag = Tag.find_by name: tag
      found_tag ? found_tag.id : nil
    end
  end

  def linked_materials_from tag_ids
    MaterialTagLink.where(tag_id: tag_ids).map do |link|
      link.material_id
    end
  end

  def get_shared ids
    ids.select do |id|
      ids.count(id) == tag_params.count
    end
  end

  def get_materials_from ids
    Material.where(id: ids)
  end
end
