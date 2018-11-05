class Article::Index < BaseOperation
  step :prepare_params!
  step :finder!
  step :model!
  step :represent!
  failure :handle_internal_error!

  private

  def default_sort
    'created_at desc'
  end

  def prepare_params!(options, params:, **)
    options[:params] = {} if params.blank?
    options[:params][:sort] = default_sort if params[:sort].blank?
  end

  def finder!(options, params:, **)
    options[:finder] = Article::Finder.new(
      filter: params,
      page: params[:page]
    )
  end

  def model!(options, finder:, **)
    options[:model] = finder.results.all
  end

  def represent!(options, model:, **)
    options[:model] = Article::Representer::Index.new(model).to_hash
  end
end
