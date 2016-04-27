class MaterialsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    render json: Tag.all, only: [:id, :name], include: {materials: {only: [:id, :title, :link_url, :description]}}

    # render json: Material.all
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
