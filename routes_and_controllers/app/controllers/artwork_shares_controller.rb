class ArtworkSharesController < ApplicationController

  def create
    share = ArtworkShare.new(artwork_share_params)
    if share.save
      render json: share
    else
      render json: share.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    share = ArtworkShare.find(id: params[:id])
    if share.delete
      render json: share
    else
      render json: share.errors.full_messages, status: :forbidden
    end
  end

  def favorite
    share = ArtworkShare.find(params[:id])
    toggle = !share.favorite
    if share.update({favorite: toggle})
      render json: share
    else
      render json: share.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def artwork_share_params
    params.require(:artwork_share).permit(:artwork_id, :viewer_id)
  end

end