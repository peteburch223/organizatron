class TagsController < ApplicationController
  def index
    render json: Tag.all, only: :name, include: {materials: {only: [:title, :link_url, :description]}}
  end
end
