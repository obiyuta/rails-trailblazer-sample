class Article::Representer::Index < Representable::Decorator
  include Representable::JSON::Collection

  items class: Article do
    include ArticleRepresentable
  end
end
