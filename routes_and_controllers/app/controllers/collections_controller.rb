class CollectionsController < ApplicationController

  def index
    if params.has_key?(:id)
      render json: Collection.find(params[:id]).members
    elsif params.has_key?(:user_id)
      render json: Collection.where(user_id: params[:user_id])
    else
      render json: Collection.all
    end
  end

  def create
    collection = Collection.new(collection_params)

    if collection.save
      render json: collection
    else
      render json: collection.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    collection = Collection.find(id: params[:id])

    if collection.update(collection_params)
      render json: collection
    else
      render json: collection.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    collection = Collection.find(id: params[:id])

    if collection.delete
      render json: collection
    else
      render json: collection.errors.full_messages, status: :conflict
    end
  end


  private

  def collection_params
    params.require(:collection).permit(:title, :description, :user_id)
  end

end
