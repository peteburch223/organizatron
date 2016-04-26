class TagsController < ApplicationController
  def index
    # require 'pry'; binding.pry
    render json: Tag.all, only: [:id, :name], include: {materials: {only: [:id, :title, :link_url, :description]}}
  end
end
