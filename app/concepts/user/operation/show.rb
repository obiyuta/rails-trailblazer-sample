class User::Show < BaseOperation
  step Model(User, :find)
  step :represent!

  def represent!(options, model:, **)
    options[:model] = User::Representer::Show.new(model).to_hash
  end
end
