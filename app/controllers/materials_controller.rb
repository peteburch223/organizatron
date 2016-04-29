require_relative '../../lib/materials_presenter'


class MaterialsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    consolidated_data = MaterialsPresenter.new(params)
    render json: consolidated_data.get_materials
  end

  def create
    material = Material.new(material_params_for_create)

    tag_params_for_create.each do |t|
      material.tags << Tag.where(name:t).first_or_create
    end

    if material.save
      render json: material, status: :created
    end
  end

  private

  def material_params_for_create
    params.require(:material).permit(:title, :description, :link_url)
  end

  def tag_params_for_create
    params.require(:tags).split(",")
  end
end
