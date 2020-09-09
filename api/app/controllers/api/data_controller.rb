class Api::DataController < ApplicationController
  acts_as_token_authentication_handler_for User

  # GET /data
  def index
    @user = current_user
    @types = Type.order(:title).all
    @tags = Tag.order(:title).where(type_id: @types.map { |type| type.id })
    @articles = Article.order(:title).where(tag_id: @tags.map { |tag| tag.id })
    @articles = @articles.where(user_id: @user.id, hidden: 1).or(@articles.where(hidden: 0)).as_json
    @articles.each do |article|
      article[:user] = User.select('id', 'username').where(id: article['user_id']).first
    end
    render json: {
      loaded: true,
      types: @types,
      tags: @tags,
      articles: @articles,
    }
  end

  def index1
    @types = Type.all.as_json
    @types.each do |type|
      type[:tags] = Tag.where(type_id: type['id']).as_json
      type[:tags].each do |tag|
        tag[:articles] = Article.where(tag_id: tag['id']).as_json
      end
    end
    @data = @types
    # @tags = Tag.where(type_id: @types.map { |type| type.id })
    # @articles = Article.where(tag_id: @tags.map { |tag| tag.id })
    render json: {
      data: @data,
    }
  end
end
