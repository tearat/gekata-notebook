class Api::ArticlesController < ApplicationController
  acts_as_token_authentication_handler_for User
  before_action :set_item, only: [:show, :update, :destroy]

  # GET /articles
  def index
    render json: Article.select('id', 'title', 'body', 'tag_id').all
  end

  # GET /articles/:id
  def show
    @article = Article.find(params[:id])
    render json: @article, status: 200
  end

  # POST /articles
  def create
    if @article = Article.create(article_params)
      render json: @article, status: :created
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /articles/:id
  def update
    if @article.update(article_params)
      render json: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # DELETE /articles/:id
  def destroy
    id = @article.id
    if @article.destroy
      render :json => {:message => "Article #{id} deleted"}, :status => 404
    else
      render json: @article.errors, status: :unprocessable_entity
    end

  end

  private

  def set_item
    if Article.exists?(params[:id])
      return @article = Article.select('id', 'title', 'body', 'tag_id').find(params[:id])
    else
      render :json => {:error => "Article not found"}, :status => 404
    end
  end

  def article_params
    params.permit(:title, :body, :tag_id)
  end
end
