class Api::TypesController < ApplicationController
  # acts_as_token_authentication_handler_for User

  # GET /types
  def index
    render json: Type.all, each_serializer: TypeEachSerializer
  end

  # GET /types/:id
  def show
    @type = Type.find(params[:id])
    # render json: @type, user_id: current_user.id
    render json: @type, user_id: 1
  end
end
