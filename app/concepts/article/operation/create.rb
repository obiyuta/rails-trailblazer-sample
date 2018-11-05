class Article::Create < BaseOperation
  step Model(Article, :new)
  step :assign_user!
  step Contract::Build(constant: Article::Contract::Create)
  step Contract::Validate()
  failure :handle_validation_error!, fail_fast: true
  step Wrap(TransactionBlock) {
    # some steps in the same transaction here.
    step Contract::Persist()
  }
  failure :handle_internal_error!

  private

  def assign_user!(options, current_user:, **)
    options[:model].user = current_user
  end
end
