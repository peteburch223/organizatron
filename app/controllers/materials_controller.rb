class MaterialsController < ApplicationController
  def index
    render json: Material.all
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

  def material_params
    params.require(:material).permit(:title, :description, :link_url)
  end
end
