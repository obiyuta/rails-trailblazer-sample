class Article::Contract::Create < BaseForm
  include Reform::Form::ActiveRecord

  model :article

  property :user_id
  property :title
  property :content
  property :is_pickup

  validation :default do
    validates(
      :title,
      presence: true,
      length: { maximum: 200 }
    )

    validates(
      :content,
      presence: true,
      length: { maximum: 1000 }
    )
  end

  validation :custom, after: :default do
    validate :check_user_existence
    validate :check_prohibited_word
  end

  private

  def check_user_existence
    errors.add(:user_id, :invalid) if User.find_by(id: user_id).blank?
  end

  def check_prohibited_word
    errors.add(:title, :invalid) if title.include?('落ちた')
  end
end
