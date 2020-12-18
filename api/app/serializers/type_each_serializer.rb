class TypeEachSerializer < ActiveModel::Serializer
  attributes :id, :title

  # @user = current_user
  #   @type = Type.find(params[:id]).as_json
  #   @articles = Article.select('id', 'title', 'body', 'hidden', 'user_id').order(:title).where(type_id: params[:id])
  #   @articles = @articles.where(user_id: @user.id, hidden: 1).or(@articles.where(hidden: 0)).as_json
  #   @articles.each do |article|
  #     article[:user] = User.select('id', 'username').where(id: article['user_id']).first
  #   end
  #   @type[:articles] = @articles
end
