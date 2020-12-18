class TypeSerializer < ActiveModel::Serializer
  attributes :id,
             :title,
             :body,
             :articles, 
             :user,
             :test

  def test
    object.title
  end

  def user
    @instance_options[:user_id]
  end

  def articles
    user_id = @instance_options[:user_id]
    articles = Article.select('id', 'title', 'body', 'hidden', 'user_id').order(:title).where(type_id: object.id)
    articles = articles.where(user_id: user_id, hidden: 1).or(articles.where(hidden: 0)).as_json
    articles.each do |article|
      article[:user] = User.select('id', 'username').where(id: article['user_id']).first
    end
    articles
  end

end
