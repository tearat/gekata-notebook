class Api::TagsController < ApplicationController
  before_action :set_item, only: [:show, :update, :destroy]

  # GET /tags/:id
  def index
    render json: Tag.select('id', 'title', 'type_id').all
  end

  # GET /tags/:id/articles
  def articles
    @tag = Tag.find(params[:id])
    @articles = Article.where(:tag_id => @tag.id)
    render json: @articles
  end

  # GET /tags/:id
  def show
    @tag = Tag.find(params[:id])
    render json: @tag, status: 200
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
