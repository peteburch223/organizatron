class MaterialsController < ApplicationController
  def index
    render json: Material.all
  end

  def create
    material = Material.new(material_params)
    if material.save
      render json: material, status: :created
    else
      respond_with_errors(material)
    end
  end

  def material_params
    params.require(:material).permit(:title, :description, :link_url)
  end

  def respond_with_errors(object)
    render json: {errors: ErrorSerializer.serialize(object)}, status: :unprocessable_entity
  end

end
