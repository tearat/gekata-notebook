class Api::ArticlesController < ApplicationController
  acts_as_token_authentication_handler_for User
  before_action :set_item, only: [:show, :update, :destroy]

  # GET /articles
  def index
    @user = current_user
    @articles = Article.order(:title).select('id', 'title', 'body', 'hidden', 'user_id')
    @articles = @articles.where(user_id: @user.id, hidden: 1).or(@articles.where(hidden: 0)).as_json
    @articles.each do |article|
      article[:user] = User.select('id', 'username').where(id: article['user_id']).first
    end
    render json: @articles
  end

  # GET /articles/:id
  def show
    @user = current_user
    @article = Article.order(:title).select('id', 'title', 'body', 'hidden', 'type_id').find(params[:id]).as_json

    @relations = ArticleTag.select('tag_id').where(article_id: params[:id])
    @tags = Tag.select('id', 'title').where(id: @relations)

    @article[:tags] = @tags
    @article[:user] = User.select('id', 'username').where(id: @user.id).first
    @article[:type] = Type.select('id', 'title').where(id: @article['type_id']).first

    render json: @article
  end

  # POST /articles
  def create
    # return render json: params
    @article = Article.new(article_params)
    if @article.save
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
      return @article = Article.select('id', 'title', 'body', 'type_id').find(params[:id])
    else
      render :json => {:error => "Article not found"}, :status => 404
    end
  end

  def article_params
    params.permit(:title, :body, :type_id, :hidden, :user_id)
  end
end
