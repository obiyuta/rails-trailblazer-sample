class Article::Edit < BaseOperation
  step Model(Article, :find)
  step Policy::Pundit(Article::Policy, :author?)
  failure :handle_policy_error
  step Contract::Build(constant: Article::Contract::Create)
  step :form!
  step :represent!

  def represent!(options, model:, **)
    options[:model] = Article::Representer::Show.new(model).to_hash
  end
end
