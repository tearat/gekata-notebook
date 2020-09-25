class Api::TagsController < ApplicationController
  acts_as_token_authentication_handler_for User
  before_action :set_item, only: [:show, :update, :destroy]

  # GET /tags/:id
  def index
    @user = current_user
    # render json: Tag.select('id', 'title', 'type_id').all
    @tags = Tag.select('id', 'title', 'body').as_json

    @tags.each do |tag|
      @relations = ArticleTag.select('article_id').where(tag_id: tag['id'])
      @articles = Article.order(:title).where(id: @relations)
      @articles = @articles.where(user_id: @user.id, hidden: 1).or(@articles.where(hidden: 0)).as_json
      tag[:articles_count] = @articles.length
    end

    render json: @tags
  end

  # GET /tags/:id
  def show
    @user = current_user
    @tag = Tag.find(params[:id]).as_json

    @relations = ArticleTag.select('article_id').where(tag_id: params[:id])
    @articles = Article.order(:title).select('id', 'title', 'body', 'hidden', 'user_id').where(id: @relations)
    @articles = @articles.where(user_id: @user.id, hidden: 1).or(@articles.where(hidden: 0)).as_json
    @articles.each do |article|
      article[:user] = User.select('id', 'username').where(id: article['user_id']).first
    end

    @tag[:articles] = @articles

    render json: @tag
  end

  # POST /tags
  def create
    if @tag = Tag.create(tag_params)
      render json: @tag, status: :created
    else
      render json: @tag.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tags/:id
  def update
    if @tag.update(tag_params)
      render json: @tag
    else
      render json: @tag.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tags/:id
  def destroy
    id = @tag.id
    if @tag.destroy
      render :json => {:message => "Tag #{id} deleted"}, :status => 404
    else
      render json: @tag.errors, status: :unprocessable_entity
    end

  end

  private

  def set_item
    if Tag.exists?(params[:id])
      return @tag = Tag.select('id', 'title', 'type_id').find(params[:id])
    else
      render :json => {:error => "Tag not found"}, :status => 404
    end
  end

  def tag_params
    params.permit(:title, :body, :type_id)
  end
end
