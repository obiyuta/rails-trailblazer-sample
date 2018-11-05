module ArticleRepresentable
  extend ActiveSupport::Concern

  included do
    include Representable::JSON

    property :id, render_nil: true
    property :title, render_nil: true
    property :content, render_nil: true
    property :is_pickup
    property :user do
      property :name
    end

    property :created_at_ja, exec_context: :decorator

    def created_at_ja
      represented.created_at.strftime('%Y年%m月%日')
    end
  end
end
