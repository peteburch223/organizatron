class MaterialsController < ApplicationController
  def index
    render json: Material.all
  end
end
