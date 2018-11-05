class User::Representer::Show < Representable::Decorator
  include Representable::JSON

  property :id
  property :name
  property :updated_at, getter: ->(represented:, **) {
                                  represented.updated_at.strftime('%Y-%m-%d %H:%M')
                                }
  property :created_at, exec_context: :decorator

  def created_at
    represented.created_at.strftime('%Y-%m-%d')
  end
end
