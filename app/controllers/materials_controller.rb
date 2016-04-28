class MaterialsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index

    p tag_params_for_index.nil?

    puts "Parameters: #{tag_params_for_index}"


    if tag_params_for_index
      material_tag_link_ids = linked_materials_from tag_ids
      p "*****************"
      p material_tag_link_ids

      # mtl_vote_count = vote_count_for material_tag_link_ids

      mtl_tag_hash = tag_for material_tag_link_ids

      materials = get_materials_for mtl_tag_hash

      p

      p mtl_vote_count
      # p material_ids
      shared_material_ids = get_shared material_tag_link_ids
      materials = (get_materials_from shared_material_ids.uniq) #, only: [:id, :name], include: {materials: {only: [:id, :title, :link_url, :description]}}

      p materials
    else
      materials = Material.all
    end

    # byebug
    # material_ids = linked_materials_from get_tag_ids
    # shared_material_ids = get_shared material_ids
    #
    # materials = (get_materials_from shared_material_ids.uniq)

    # materials = (get_materials_from shared_material_ids.uniq), only: [:id, :name], include: {materials: {only: [:id, :title, :link_url, :description]}}
    # byebug
    render json: materials, only: [:id, :title, :link_url, :description], include: {tags: {only: [:id, :name]}}
    # render json: materials, only: [:id, :title, :link_url, :description], include: {votes: {only: [:id, :value]}}
    # render json: { "materials" => materials_formatted }
  end

  def create
    tags = params['material']['tags']

    material = Material.new(material_params_for_create)
    # tags.each { |t| material.tags << Tag.create( name: t['name'] ) }
    tags.each { |t| material.tags << Tag.create( name: t ) }

    if material.save
      render json: material, status: :created
    end
  end

  private

  def material_params_for_create
    params.require(:material).permit(:title, :description, :link_url)
  end

  def tag_params_for_index
    params.require(:tags).split(" ") if params[:tags]
  end

  def vote_count_for material_tag_link_ids
    Vote.group(:material_tag_link_id).sum(:value)
  end

  def tag_for material_tag_link_ids
    result = {}
    byebug
    material_tag_link_ids.map do |mtl_id|
      temp ={}

      temp[:tag_id] = MaterialTagLink.find(mtl_id).tag.id
      temp[:tag_name] = MaterialTagLink.find(mtl_id).tag.name
      temp[:votes] = MaterialTagLink.find(mtl_id).votes.sum(:value)


      result[mtl_id] = temp

    end

    return result
  end

  def get_materials_for mtl_tag_hash
    result = []
    mtl_tag_hash.each do |k, v|

      temp = {}
      temp[:id] = MaterialTagLink.find(k).material.id
      temp[:link_url] = MaterialTagLink.find(k).material.link_url
      temp[:description] = MaterialTagLink.find(k).material.description
      temp[:title] = MaterialTagLink.find(k).material.title
      temp[:tags] = v
      result << temp
    end
        # byebug
    return result

  end



  def tag_ids
    tag_params_for_index.map do |tag|
      found_tag = Tag.find_by name: tag
      found_tag ? found_tag.id : nil
    end
  end

  def linked_materials_from tag_ids
    MaterialTagLink.where(tag_id: tag_ids).map do |link|
      link.id
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
