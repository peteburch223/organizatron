class VotesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    # byebug
    mtl = MaterialTagLink.all.select {|e| e.tag_id == vote_params[:tag_id] && e.material_id == vote_params[:material_id] }.first
    vote = Vote.new(value: vote_params[:value], material_tag_link_id: mtl.id)

    if vote.save
      render json: vote, status: :created
    end
  end

  def vote_params
    p params
    params.require(:vote).permit(:value, :tag_id, :material_id)
  end
end
