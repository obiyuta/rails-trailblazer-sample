class Article::New < BaseOperation
  step Model(Article, :new)
  step Contract::Build(constant: Article::Contract::Create)
  step :form!
end
