class Api::TypesController < ApplicationController
  acts_as_token_authentication_handler_for User

  # GET /types
  def index
    render json: Type.select('id', 'title').all
  end

  # GET /types/:id
  def show
    @type = Type.find(params[:id])
    @tags = Tag.where(:type_id => @type.id)
    @articles = Article.where(tag_id: @tags.map { |tag| tag.id })
    render json: {
      type: @type,
      tags: @tags,
      articles: @articles,
      user: current_user
    }
  end
end
