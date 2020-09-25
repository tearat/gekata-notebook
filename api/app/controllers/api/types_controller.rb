class Api::TypesController < ApplicationController
  acts_as_token_authentication_handler_for User

  # GET /types
  def index
    render json: Type.select('id', 'title').all
  end

  # GET /types/:id
  def show
    @user = current_user
    @type = Type.find(params[:id]).as_json
    @articles = Article.select('id', 'title', 'body', 'hidden', 'user_id').order(:title).where(type_id: params[:id])
    @articles = @articles.where(user_id: @user.id, hidden: 1).or(@articles.where(hidden: 0)).as_json
    @articles.each do |article|
      article[:user] = User.select('id', 'username').where(id: article['user_id']).first
    end
    @type[:articles] = @articles

    render json: @type
  end
end
