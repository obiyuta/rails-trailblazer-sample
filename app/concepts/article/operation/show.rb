class Article::Show < BaseOperation
  step Model(Article, :find)
  step :represent!

  def represent!(options, model:, **)
    options[:model] = Article::Representer::Show.new(model).to_hash
  end
end
