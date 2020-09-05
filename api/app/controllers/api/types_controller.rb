class Api::TypesController < ApplicationController
  acts_as_token_authentication_handler_for User

  # GET /types/:id
  def index
    render json: Type.select('id', 'title').all
  end

  # GET /types/:id/tags
  def tags
    @type = Type.find(params[:id])
    @tags = Tag.where(:type_id => @type.id)
    render json: @tags
  end
end
