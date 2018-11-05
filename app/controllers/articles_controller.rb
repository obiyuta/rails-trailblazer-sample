class ArticlesController < ApplicationController
  def index
    run Article::Index
  end

  def show
    run Article::Show
  end

  def new
    run Article::New
  end

  def create
    result = run Article::Create

    return render :new if result['validation.invalid']

    redirect_to article_path(result[:model]['id'])
  end

  def edit
    run Article::Edit
  end

  def update
    result = run Article::Update

    return render :new if result['validation.invalid']

    redirect_to article_path(result[:model]['id'])
  end
end
