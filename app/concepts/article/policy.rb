class Article::Policy < BasePolicy
  def author?
    @user.id == @model.user_id
  end
end
