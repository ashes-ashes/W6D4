class CollectionMembershipsController < ApplicationController
  

  def create
    membership = CollectionMembership.new(collection_membership_params)

    if membership.save
      render json: membership
    else
      render json: membership.errors.full_messages, status: :unprocessable_object
    end
  end

  def destroy
    membership = CollectionMembership.find(params[:id])

    if membership.delete
      render json: membership
    else
      render json: membership.errors.full_messages, status: :bad_request
    end

  end

  private

  def collection_membership_params
    params.require(:collection_membership).permit(:artwork_id, :collection_id)
  end

end
