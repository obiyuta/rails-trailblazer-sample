class Article::Update < BaseOperation
  step Model(Article, :find)
  step Policy::Pundit(Article::Policy, :author?)
  failure :handle_policy_error
  step Contract::Build(constant: Article::Contract::Create)
  step Contract::Validate()
  failure :handle_validation_error!, fail_fast: true
  step Wrap(TransactionBlock) {
    # some steps in the same transaction here.
    step Contract::Persist()
  }
  failure :handle_internal_error!
end
