class TagsController < ApplicationController
  def index
    #Tag.find
    render json: Tag.all, only: [:id, :name], include: {materials: {only: [:id, :title, :link_url, :description]}}
  end

  def new
    require 'pry'; binding.pry
  end
end
