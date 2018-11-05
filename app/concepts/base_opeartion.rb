class BaseOperation < Trailblazer::Operation
  private

  def prepopulate!(opts, **)
    opts['contract.default'].prepopulate!
  end

  def sync!(opts, **)
    opts['contract.default'].sync
  end

  # Call after Contract::Validate
  def form!(options, **)
    options['contract.default'].sync do |hash|
      options[:form] = hash.merge(errors: {})
    end
    options['contract.default'].sync
  end

  def handle_validation_error!(options, **)
    options['validation.invalid'] = true

    options['contract.default'].sync do |hash|
      errors = options['contract.default'].errors.messages
      options[:form] = hash.merge(errors: errors)
    end
  end

  def handle_policy_error(_options, **)
    raise 'policy error'
  end

  def handle_internal_error!(_options, **)
    raise 'internal error'
  end
end
